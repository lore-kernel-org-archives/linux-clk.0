Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Eric Anholt <eric@anholt.net>
To: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stephen Warren <swarren@wwwdotorg.org>,
	Lee Jones <lee@kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@linaro.org>,
	devicetree@vger.kernel.org
Subject: Rasperry Pi clock support
Date: Thu, 13 Aug 2015 16:05:39 -0700
Message-Id: <1439507142-2965-1-git-send-email-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

I'm also avoiding requests to set rate/state when they're a no-op, as
apparently no-op changes to pixel clock break the firmware-configured
display setup.  It *shouldn't* change anything, but I've confirmed
that setting the CPU clock works fine, and after a couple of weeks of
prodding pixel clock now, I'm at a loss for what's going on with it.

