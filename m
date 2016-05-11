Return-Path: <serveralex@gmail.com>
Return-Path: <serveralex@gmail.com>
From: =?UTF-8?q?Alexander=20M=C3=BCller?= <serveralex@gmail.com>
To: mturquette@baylibre.com,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/2] Add meson8b clk81 clock gates
Date: Wed, 11 May 2016 20:21:03 +0200
Message-Id: <1462990865-22651-1-git-send-email-serveralex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

This patch series adds support for the Amlogic meson8b clk81 clock 
gates and is a prerequisite for enabling the ethernet support and other
subsystems.

The patches are also part of the following patch series:

http://comments.gmane.org/gmane.linux.ports.arm.kernel/498959

Alexander Müller (2):
  ARM: clk: Amlogic: Add support for clock gates
  ARM: clk: Amlogic: Add clk81 clock gates

 drivers/clk/meson/clkc.c                 |  18 +++
 drivers/clk/meson/clkc.h                 |  18 +++
 drivers/clk/meson/meson8b-clkc.c         | 196 +++++++++++++++++++++++++++++++
 include/dt-bindings/clock/meson8b-clkc.h |  99 +++++++++++++++-
 4 files changed, 329 insertions(+), 2 deletions(-)

-- 
2.5.0
