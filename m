Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/2] Renesas R8A77980 CPG/MSSR clock support
To: Rob Herring <robh+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-clk <linux-clk@vger.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Message-ID: <644095ad-42c5-a4fc-728a-76377938d2f1@cogentembedded.com>
Date: Thu, 15 Feb 2018 14:54:18 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hello!

Here's the set of 2 patches against the 'clk-renesas' branch of Geert Uytterhoeven's
'renesas-drivers.git' repo. We're adding the CPG/MSSR driver support for R8A77980...

[1/2] dt-bindings: clock: add R8A77980 CPG core clock definitions
[2/2] clk: renesas: cpg-mssr: add R8A77980 support

MBR, Sergei
