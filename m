Return-Path: <khilman@baylibre.com>
Return-Path: <khilman@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,  sboyd@codeaurora.org,  mturquette@baylibre.com,  devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ARM64: dts: meson-gxbb: Add GXBB AO Clock and Reset node
References: <1471514928-3341-1-git-send-email-narmstrong@baylibre.com>
	<1471514928-3341-4-git-send-email-narmstrong@baylibre.com>
Date: Fri, 19 Aug 2016 15:03:06 -0700
In-Reply-To: <1471514928-3341-4-git-send-email-narmstrong@baylibre.com> (Neil
	Armstrong's message of "Thu, 18 Aug 2016 12:08:48 +0200")
Message-ID: <7hk2fc76xx.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Neil Armstrong <narmstrong@baylibre.com> writes:

> Add the AO clock controller node for the AmLogic GXBB SoC.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---

Applying this to the amlogic tree, but will need to wait a cycle due to
include dependencies on the bindings, which are going through the clock
tree.

Kevin
