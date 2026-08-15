import path from "node:path";
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

export default function (pi: ExtensionAPI): void {
	pi.on("session_start", (_event, ctx) => {
		if (ctx.mode === "tui") {
			const title = pi.getSessionName()?.trim() || path.basename(ctx.cwd);
			setTimeout(() => ctx.ui.setTitle(title), 0);
		}
	});

	pi.on("session_info_changed", (event, ctx) => {
		if (ctx.mode === "tui") {
			ctx.ui.setTitle(event.name?.trim() || path.basename(ctx.cwd));
		}
	});
}
