Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1AC27281E;
	Mon, 26 Jan 2026 19:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769455999; cv=none; b=l4g8v+j2VhbgOCakke3/CjLXow/iqS/maUm+LIXqtSYLm/6SyDxqaOwwR1C10q8Kw1lS/dWUEgaKd4TGZOzsI+omMFf2d5fC7ZhLkj5EqzubXLI0zyLJhNRzfGGiS4PVy87aBx/7td3Uet0RxR18YWELLNENcWkUOHI4Jw1PIBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769455999; c=relaxed/simple;
	bh=264+Xfb5c4awn+mzb3XEn33nMkHF+cNYJxf99O8WpCE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RMJfrXGFjd4oeMDG7PsG0WbkWsrtE/Lnoq1kTZs8fbQDw+Qrw+pyz5hHJf8RCrMvV2/Cyn/5P8b8wQiGeh+ALqFeEdJRqbHqXYNKYVA6HZFDuOj9QNI1egoplFJrVB1pM//L8jppyhpIWa4xUhBMnEYZGJglWxFfr8o2IVPMlGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Y3KtdntC; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Y3KtdntC"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C7A310CB40;
	Mon, 26 Jan 2026 20:33:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769455995;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wt4OrgVEIcV51CcZvKwLJ3NpZgfF1uIkSphQcpsf+Cg=;
	b=Y3KtdntCmeXAWNwkilx8KtuOSSR6ibCodG6TqhiDsMDNqKcTcgeKkaMlcQoZxFAgx9NLsk
	dFYIcxCns5jSTjaaFYtky8wd46Hy1TKGicr0PD5peIHmjVI8JOayhJ37s5x0t6vTcnCLVy
	tJAHnv0a8xyJKPCiAlRxcjCv4H8I/ZoSFMbbDcD8OvlLlwn2Sk6kGyXJbU1F8VVeY5qvif
	tcjnkppQEGgHmZWXaEnVsfSq/CorQPwKsz7ryjnX2MS+sBNvplNgtpl/k9c+0JU0IneCdo
	QHG59G0vIoslHAtYiq2gtBpJMH/qUmiAQImbXkOslbhToepYAy0tSOn/WVr/YQ==
Date: Mon, 26 Jan 2026 20:33:07 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] clk: vf610: Add support for the Ethernet switch
 clocks
Message-ID: <20260126203307.6076ba9c@wsk>
In-Reply-To: <7671b833-f823-44cd-b5af-0b473a8ae23e@lunn.ch>
References: <20260126115349.1750578-1-lukma@nabladev.com>
	<7671b833-f823-44cd-b5af-0b473a8ae23e@lunn.ch>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Andrew,

> On Mon, Jan 26, 2026 at 12:53:49PM +0100, Lukasz Majewski wrote:
> > From: Lukasz Majewski <lukma@denx.de>
> > 
> > The vf610 device has built in the MoreThanIP L2 switch. For proper
> > operation it is required to enable ESW and MAC table lookup clocks.
> > 
> > The MAC table spans from 0x400E_C000 for 0x4000 and it is necessary
> > to provide clocks for each AIPS1-"slot", which size is 0x1000
> > (hence four separate entries).
> > 
> > Those can be enabled via clock gating CCM_CCGR10 register
> > (0x4006_B068).
> > 
> > This patch also adds VF610_CLK_ESW and VF610_CLK_ESW_MAC_TAB{0123}
> > macros definitions for L2 switch.
> > 
> > The VF610_CLK_END has been removed as its number had to be increased
> > when MTIP L2 switch clocks were added.
> > 
> > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> > ---
> > Changes for v2:
> > - Squash clock DT bindings to this single patch
> > - Replace VF610_CLK_END with VF610_CLK_ESW_MAC_TAB3 + 1  
> 
> I'm not sure this is the correct thing to do. Normally these _END
> values are there so you don't need to change any code when new things
> are added to the list. 
> 
> Why not just keep VF610_CLK_END at the end, with the value of 196?
> 
>     Andrew

Conor (on CC) explicitly asked to remove VF610_CLK_END:
"[PATCH] dt-bindings: clock: vf610: Add definitions for MTIP L2 switch"

------>8------------
> -#define VF610_CLK_END			191  

If end is modifiable, it is removable. If you need the define for the
driver, please move it there.
------8<------------

I just follow what he asked.

-- 
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic
