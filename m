Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B19193072
	for <linux-clk@vger.kernel.org>; Fri, 14 Jun 2024 10:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718360267; cv=none; b=J407i/+WrCCcmRYdAb0zgLSECaNLKv+THJk+Am2u2AnU4KntDJfRCJMJda3OS1qyHMlJJu/1ngBj5rl9BdspeeR21vDpgXZeoW4V8hcohc09m5hWi2BY2wstCb3rrY4MlHAfiY7N10QO9nzC00ecAERBQgqvLAljtb4a2zln94I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718360267; c=relaxed/simple;
	bh=BtH/RKSYaAqxELT3qVRNNqUqpHc8LxARL4H5WzDeODs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLTXDW9vx+Geq2jE+fi+n5v7z/6khnDMT/sYguwWnFQ1gn59+EFNqNdDDmeV+wVeou1okL0X8b7QC9jCbMx21Tv9WHr7yv12atfM1tGIDcgj0qG/QIbdU4EXOXDeaSv+kQJf/wDe7fxmPfMhWnIxWxBih7cxvmjpv6xBt6hVOxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1sI3zt-0005L3-2i; Fri, 14 Jun 2024 12:17:29 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1sI3zr-002FB3-GE; Fri, 14 Jun 2024 12:17:27 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1sI3zr-00AOq7-1I;
	Fri, 14 Jun 2024 12:17:27 +0200
Date: Fri, 14 Jun 2024 12:17:27 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: p.zabel@pengutronix.de, abelvesa@kernel.org, peng.fan@nxp.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	marex@denx.de, linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com
Subject: Re: [PATCH v8 2/5] clk: imx: clk-audiomix: Add reset controller
Message-ID: <20240614101727.zkh32bqe5nurnmbx@pengutronix.de>
References: <1718350923-21392-1-git-send-email-shengjiu.wang@nxp.com>
 <1718350923-21392-3-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1718350923-21392-3-git-send-email-shengjiu.wang@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On 24-06-14, Shengjiu Wang wrote:
> Audiomix block control can be a reset controller for
> Enhanced Audio Return Channel (EARC), which is one of
> modules in this audiomix subsystem.
> 
> The reset controller is supported by the auxiliary device
> framework.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
