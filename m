Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5048E18DB2A;
	Fri,  5 Jun 2026 06:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640563; cv=none; b=kmlp3WTJiy1JY5NoUlUgTpF6nGwunMDvyM/zmilcvSKnWcb0GVMQC3K0wSq2wzMXZk5i3XainnmkczIfaSq8/1AlwfNZdL6qrMXT3Geykao3LL75mGi/ve4LwG+gSl/YfnsSBntPEnICRMB/pjCPDq7ptiJuY/mT8eFpKptxTVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640563; c=relaxed/simple;
	bh=/Ns6DTq+8DsTA4xwCKVubKahgU7igEr6+hdO7SxL41g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lTOQl86Lta6m0vcwylhXnxwLSuNTjpNR+pw6OR5VgAJm1uSa27WuyT7/EiS+mihBaUVwVgWMEAMHaMBRlRSS1AwxNa+E4lR6oGc6ZIW7wb21nQx79DJUzcCASofxKB3e3JST6FvhPvQ6jG8MSPWJcNkSrx99CNSmRUc9L349NX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mOT3clha; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mOT3clha"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C77304E40776;
	Fri,  5 Jun 2026 06:22:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9616A5FED1;
	Fri,  5 Jun 2026 06:22:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 065EF106A1E91;
	Fri,  5 Jun 2026 08:22:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780640559; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=itgvrKgGJ/hZBcU2Yh0c5GwX/tfH3NV2YQVR5HTSjAk=;
	b=mOT3clhaDxHEUX+6B2W8H+rw4w7kmGhSaoOlHf2q5msryrqaOpgynLHOtZmXLFyaZTjLkR
	6YKdbBP2NSuiiVi7NEcW8rHOL27D3tM2GH6I99iXJqDrU/rzKKTVFyA4nEHH5vCm3KQgxg
	JiRgYDa/hQBjSwOUTTOTNn77AxpHl35Coi0wZaN1G8YOzzcemTV9tyP2wsvt4q4AASO8sg
	x36def1t70cATLMDbb3G02GpfCaQhSJGb6N7POPjHZhoGJs+a5JAQ88oFd0lmumOHtBhA/
	WTv+1qiupScrCVsj2EwBm+1NEiSCD4qqQll2p/jXOY0ZcZm44b+ojWOSh2MpCg==
Date: Fri, 5 Jun 2026 08:22:36 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Allan Nielsen
 <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Daniel Machon
 <daniel.machon@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v7 1/1] clk: lan966x: Add MCHP_LAN966X_PCI dependency
Message-ID: <20260605082236.6fc9f76d@bootlin.com>
In-Reply-To: <20260511160113.34755-2-herve.codina@bootlin.com>
References: <20260511160113.34755-1-herve.codina@bootlin.com>
	<20260511160113.34755-2-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On Mon, 11 May 2026 18:01:12 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> The lan966x clock controller depends on the LAN969x architecture or the
> LAN966x SoC.
> 
> This clock controller can be used by the LAN966x PCI device and so it
> needs to be available when the LAN966x PCI device is enabled.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

IMHO, the patch is ready to be applied.

What is your opinion?

Best regards,
Hervé
