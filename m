Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACBD33064D;
	Wed, 16 Sep 2026 18:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789582799; cv=none; b=lhiqReiWcDzX/CQ1l4SR3YWwG0ZRsvkgxza9HLPMtC0gtsPe2vganSugdDqLTudgmXoSJm3CL4e+mlF1JGJ1TbULEUJGwxWCQyXfviqRNcguW4rBFRIi6uJCyXVL2eoz2XXruLdhORH4WOPRyzv3Lq+9SY43n7UkcvykBFhuY6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789582799; c=relaxed/simple;
	bh=rxT8OqLJ31FEIFu+AVrtNB+EaZiDH17h68FhErDeN9o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bMyuA57fMR6fGKrr2jN3l7EGyaHWEsXa1UiGaVV+d9Tb2p1M+G1RZyvKLClN71n6rvPnED6DAM1axtI7QGA1QVb3XPM5vnpHoB1chezb0OrSLG2m0zefpODNHLWg6IH7x7SDwQjzhDgri6hdKwOWc+LOpw8K0vXD074Rma8wGBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YYw0SmUq; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YYw0SmUq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4FAF5C5CD5B;
	Wed, 16 Sep 2026 18:20:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E99460337;
	Wed, 16 Sep 2026 18:19:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6853411C7B00D;
	Wed, 16 Sep 2026 20:19:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789582787; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=U7J/mha/vyoFLlNNVH4h4FCmPvf41iQDGOaDHu79fqs=;
	b=YYw0SmUqgK0SDDwSStx/seLZ1MC/bDXvVn5c1k7ZXfly8akIrh4xlRzjzhA/bQtYYLFnjC
	2Ahd/xg1rWoaEn5dHg2AOiCXO2QwQT5Lqs1BrE0maT19M5ipwwr+AzF1T5esnhhXen00/l
	MxTQhHbOoqrGrDzr9cahGFJ1ISRNbIu3OeHhF6A6vgzbNejanIn4H3dhNl9V/gE0MzZ1QO
	/dJFoOVmDyeXP7QfAkQYdnl+/YTeEC/fpsufL5y9SJ0PqZ/aglzMb0DalOGa4r8x7oxSgv
	JLnOtqlva1ms9MZBMtlY8JXqQi0U5hop5q+nsm9hnHrYbFkNDa6xdD04YnHx2w==
Date: Wed, 16 Sep 2026 20:19:44 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, Frank Li
 <Frank.li@oss.nxp.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Linus Walleij
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Leonardo Costa <leonardo.costa@toradex.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, Ernest Van Hoecke
 <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 7/7] of: unittest: Test fw_devlink with clock nexus
 maps
Message-ID: <20260916201944.650c83be@bootlin.com>
In-Reply-To: <20260910-fw-devlink-nexus-ready-v2-7-17ac82dbe226@toradex.com>
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
	<20260910-fw-devlink-nexus-ready-v2-7-17ac82dbe226@toradex.com>
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

Hi Ernest,

On Thu, 10 Sep 2026 16:16:48 +0200
Ernest Van Hoecke <ernestvanhoecke@gmail.com> wrote:

...

>  				fwdevlink_nexus: nexus {
> +					#clock-cells = <1>;
>  					#gpio-cells = <2>;
>  					#pwm-cells = <2>;
> +					clock-map = <0 &clock_provider 1>;

No map-mask for clocks ?

And also same comment as for GPIOs (i.e. multiple items in map)

>  					gpio-map = <0 0 &gpio_provider 1 0>;
>  					gpio-map-mask = <0xffffffff 0>;
>  					gpio-map-pass-thru = <0 0xffffffff>;
> @@ -100,6 +106,14 @@ fwdevlink_nexus: nexus {
>  					pwm-map-pass-thru = <0 0xffffffff>;
>  				};
>  

Best regards,
Hervé
