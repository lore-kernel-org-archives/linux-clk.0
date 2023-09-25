Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D203CE7A91
	for <linux-clk@archiver.kernel.org>; Mon, 25 Sep 2023 01:13:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbjIYBNR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 24 Sep 2023 21:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230360AbjIYBNQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 24 Sep 2023 21:13:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4813CA;
        Sun, 24 Sep 2023 18:13:10 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9EDC433C9;
        Mon, 25 Sep 2023 01:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695604390;
        bh=Wmz48UIlp2PC5T1iQz6rVBuxFVOUZ6YblW0qZ4yZewQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m74P3FZ9MNSUw+ugowyh7SlhphwEjH2qhoh4JsqgBOodaRKVV2TQ5PXk0DLtlR0bW
         MkJ2rfz01I5kZsfJDj8SUHDXsdNUrBJ+XmKMVswChappzRYtEvQm2SAV+WBpsSFzTZ
         70Fg6leER1yYOJGoLKeQNn8DPAeRVtgkgWs3pfthi1tSykXsdD00/SjpCGGHdY59xY
         AHP5Q0NCjAjNZuLmTQ70trQj5DFFS/m7OOu9E0D2GnT8+68+8Bg5oIp6jqNWj3eoeW
         x+dPDhWApsQBfS4+1XOpFcQpanmxqYbiIwdhSm8jZeW26N0EBD5kVLkseAJiLHvNDN
         Q61cbL9zbvO9A==
Date:   Mon, 25 Sep 2023 09:12:58 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, marex@denx.de,
        aford@beaconembedded.com, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH V3 2/3] arm64: dts: imx8mp: Add micfil node
Message-ID: <20230925011258.GD7231@dragon>
References: <20230831044431.250338-1-aford173@gmail.com>
 <20230831044431.250338-2-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831044431.250338-2-aford173@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Aug 30, 2023 at 11:44:30PM -0500, Adam Ford wrote:
> The i.MX8MP has a micfil controller which is used for interfacing
> with a pulse density microphone. Add the node and mark it as
> disabled by default.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied, thanks!
