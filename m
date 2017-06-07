Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Paul Cercueil <paul@crapouillou.net>
To: Ralf Baechle <ralf@linux-mips.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Cc: Paul Burton <paul.burton@imgtec.com>,
        Maarten ter Huurne <maarten@treewalker.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@linux-mips.org, linux-clk@vger.kernel.org
Subject: [PATCH 00/15] Ingenic JZ4770 and GCW Zero patchset
Date: Wed,  7 Jun 2017 22:04:24 +0200
Message-Id: <20170607200439.24450-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

This set of 15 commits brings basic support of the JZ4770 SoC from
Ingenic.

The support is currently minimal, but enough to boot to a initramfs
userspace from the serial console.

The last patch introduces support for one JZ4770 based device, the
open-source game console GCW Zero, successfully kickstarted in 2012.

Regards,
-Paul
