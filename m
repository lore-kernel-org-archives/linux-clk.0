Return-Path: <paul@crapouillou.net>
From: Paul Cercueil <paul@crapouillou.net>
To: Ralf Baechle <ralf@linux-mips.org>,
	Rob Herring <robh+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Maarten ter Huurne <maarten@treewalker.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@linux-mips.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 00/15] Ingenic JZ4770 and GCW Zero support
Date: Thu, 28 Dec 2017 14:56:19 +0100
Message-Id: <20171228135634.30000-1-paul@crapouillou.net>
In-Reply-To: <20170702163016.6714-2-paul@crapouillou.net>
References: <20170702163016.6714-2-paul@crapouillou.net>
List-ID: <linux-clk.vger.kernel.org>

Hi,

This is my v4 of my patch series to support the JZ4770 SoC from Ingenic
as well as the GCW Zero handheld console.

Not much changed since v3, I dropped the three serial-related patches
(07-08-09/18) as I will submit them separately. The only other change is
that I rebased the patch series on top of v4.15-rc5.

Regards,
-Paul Cercueil
