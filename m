Return-Path: <SRS0=w22C=WP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1496C3A5A0
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 13:36:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 834C02086C
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 13:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566221770;
	bh=fGNcLacIFF8EGFDm3k5zKrSPKgE76dI3XOtZmuEy/QI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=S3Swcu+01s/hrrhQwGof0XAuameFVH7Nyzg5a5TqARVH5IyDdrbB53+tn9ijyNyqe
	 dI3XvQydISE7XLoSS/JdJZOti5JG9xRgBtigdH9M5GfsJAhKeLCHSgeqcj2WwIKL0/
	 T0tZtBnz9EPJzXh/IT8k99g3TW1FsNhpjWbVaxPw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727529AbfHSNgK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Aug 2019 09:36:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:49738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727172AbfHSNgK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Aug 2019 09:36:10 -0400
Received: from X250 (37.80-203-192.nextgentel.com [80.203.192.37])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A02592085A;
        Mon, 19 Aug 2019 13:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566221769;
        bh=fGNcLacIFF8EGFDm3k5zKrSPKgE76dI3XOtZmuEy/QI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dYJ6hXLWwVcQGEbZZ57oeotSATtP4tNQO9J0d0PJYG9OURjR6HlV7kGut4IetqlXh
         c+IDxJejCRxqqPpmsTD4jASWB7sqriZFnPYKJurqR+IyPOxia6LgvSpFeYa+8Dn1dH
         FBn4hJt05jXpnCvUkRAWbS9oAEgRcz8kLyzZwbu4=
Date:   Mon, 19 Aug 2019 15:35:56 +0200
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, mturquette@baylibre.com,
        sboyd@kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org,
        leonard.crestez@nxp.com, abel.vesa@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH RESEND V2 1/7] arm64: dts: imx8mn-ddr4-evk: Add i2c1
 support
Message-ID: <20190819133553.GL5999@X250>
References: <1566109945-11149-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1566109945-11149-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Aug 18, 2019 at 02:32:19AM -0400, Anson Huang wrote:
> Enable i2c1 on i.MX8MN DDR4 EVK board.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
