Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
To: Rob Herring <robh+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-clk <linux-clk@vger.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Renesas R8A77980 CPG/MSSR clock support
Message-ID: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
Date: Wed, 31 Jan 2018 23:23:23 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hello!

Here's the set of 2 patches against the 'clk-renesas' branch of Geert Uytterhoeven's
'renesas-drivers.git' repo.

[1/2] dt-bindings: clock: add R8A77980 CPG core clock definitions
[2/2] clk: renesas: cpg-mssr: add R8A77980 support

MBR, Sergei
