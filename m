Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269C6174EC7
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 12:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718971697; cv=none; b=KdxSPEVzipNVGZWim0pEkiuRCMg9nGRqqW5YEHtesMVABdU/x+EqMI6R/zFsiL97aDtBDxniUvisvfZTiLEQXOP3WrJ7GnN80wrZjAyQFiLddN8sWtjKPL/1xbEUAPkj5aJn8E9ivuQwe2w3Me6ZxR5NPo6vqlmZ6UrGMLFBC6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718971697; c=relaxed/simple;
	bh=5CsIqk65T8h28pv7LSZHK/r+thMfNFgpmh7VKRl0UWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QSm61UehE6/0phloIX5YeyhJc4pflZzwnx9OzGex5BM4/JMI4YDvXtysyHPtX2yTBgmUYSC3721B+IVmKvv0xUz38zPe34bCSrwolVy1FinugG34hPcv1+tMTliQAjta2/ksJJkOXDvige6G1tYx8ZIVNWaq2+hB/2YkMN+sigY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=bwNl9B2b; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="bwNl9B2b"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-795502843ccso104041685a.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 05:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718971694; x=1719576494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CsIqk65T8h28pv7LSZHK/r+thMfNFgpmh7VKRl0UWQ=;
        b=bwNl9B2b5uBkts+d4e1DdRjRmxBlNK3fTwlrYckofd8DFZRyHpP+wuYJNoiJFzIY0N
         6J2XMZlIWqrBJdPaUYzL7AaytwBd2cv+HOibYo5pDM/cXmrBDsHNLJJg2+DNxDbfTG01
         PGNcSY0E5srlf0xby1j0hw0vKWRgAxMKkG1uK9hQshCVklS2nrHA+8JMmi+OcLH9ExEM
         76uZVM00QNMp5apgZUS8HFiWsw1t/COUYq6QZDqgb2TK+SDiYiCU5xgaajdsU4GHyF4a
         TgfV1+fSkkp2MooWuTU1LdWf577gqcZAi+/zsQBwMkDc00qjp1XBC1jfhw4NHZJs/Mg0
         fn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718971694; x=1719576494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CsIqk65T8h28pv7LSZHK/r+thMfNFgpmh7VKRl0UWQ=;
        b=gMz4Kt6IupYsZxwduQOJoyUNaycdE7bZNqouvq3YhVFUHRqBmxus69KVRfbfVC/qP1
         zxVeARrrZoTKfNwFClJRVfjdGKeACibSg+YBjglVpqSR4FqXSVB8dijZaLBUG2KHGApa
         pMzM8n086rxRLV4/gjc+LY84XRgky2PA5FfA9jGR1ot1RRHGSaGZnlyu5M3j7nZnZitI
         VY7gNdAL9RR6Sj5JRxEroL8aB8BHtIHa87LxhpnMyRsK2azolcZhBY0HuPAxjupityxy
         QyBTQJhGvzrWdx8U3NBGbXNe+9aLYVf2KU65W7TTtSaJWvOcgVLDZfbNIf4ENnrIxI8O
         Mj8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnIvp1VYe8T2SL7+aWHGJBol4tyIj0h4/UDUelpV5cVqkS1iA6Tb4t+p0rZj7azUtQKa+Bxy1WLDdEg/ifr44RKfNQls+K5gRG
X-Gm-Message-State: AOJu0YwFGwoHI4cKg7lns1Sh/Vyjo39icwZRaOBdeYmAJ5uncfXp8S6C
	zBL3vPPGpBn0VR0WwliGdjU0LfsuINmCfz578kV+Ir1K7J27UGOSx6vLUE9WPNxUsC05XGJHVj+
	9/NoqzaP1vHxkULsbpypQpXBPlmQRCrSDnCo2Gw==
X-Google-Smtp-Source: AGHT+IH9SeiO8vfdoOxDABbDkc1VlJaHvluIQfS8YUVwP2eXorBPvqf3BAKJdJfTNAn0CNJ3/z1faNaXrP6fson02ac=
X-Received: by 2002:ad4:4245:0:b0:6b0:6629:bdf9 with SMTP id
 6a1803df08f44-6b501e2c710mr72849356d6.21.1718971694039; Fri, 21 Jun 2024
 05:08:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-11-piotr.wojtaszczyk@timesys.com> <jgqhlnysuwajlfxjwetas53jzdk6nnmewead2xzyt3xngwpcvl@xbooed6cwlq4>
In-Reply-To: <jgqhlnysuwajlfxjwetas53jzdk6nnmewead2xzyt3xngwpcvl@xbooed6cwlq4>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Fri, 21 Jun 2024 14:08:03 +0200
Message-ID: <CAG+cZ04suU53wR5f0PhudgNmkxTRtwEXTS1cWH1o9_rTNM94Cg@mail.gmail.com>
Subject: Re: [Patch v4 10/10] i2x: pnx: Use threaded irq to fix warning from del_timer_sync()
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"J.M.B. Downing" <jonathan.downing@nautel.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>, 
	Li Zetao <lizetao1@huawei.com>, Chancel Liu <chancel.liu@nxp.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org, 
	Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Fri, Jun 21, 2024 at 12:57=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org>=
 wrote:
> On Thu, Jun 20, 2024 at 07:56:41PM GMT, Piotr Wojtaszczyk wrote:
> > When del_timer_sync() is called in an interrupt context it throws a war=
ning
> > because of potential deadlock. Threaded irq handler fixes the potential
> > problem.
> >
> > Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
>
> did you run into a lockdep splat?
>
> Anything against using del_timer(), instead? Have you tried?

I didn't get a lockdep splat but console was flooded with warnings from
https://github.com/torvalds/linux/blob/v6.10-rc4/kernel/time/timer.c#L1655
In the linux kernel v5.15 I didn't see these warnings.

I'm not a maintainer of the driver and I didn't do any research on
what kind of impact
would have using del_timer() instad. Maybe Vladimir Zapolskiy will know tha=
t.

--=20
Piotr Wojtaszczyk
Timesys
