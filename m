Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72003B71C0
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895759; cv=none; b=I4uwoMCH4VDVdXzU9XH4Kp3k7oE26COFUNRa8D+ko0LxIJyxNhQ5x2zP9hC2tUUjUej05QCI4lt/Jsl1c3x6sDx0dGbVx2fRIVhYCecFiIZGojhc6NKNGLR9uNzk03tuEW2PcETRqgkXbL7vRuO3/cD7UQoNcfHUQT1q6gdmHNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895759; c=relaxed/simple;
	bh=hy3ocuhI/6vDP5S05nfHI6W3yZv4jEsBq9cAYewde9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYN7YfVO+zMRC+GeQz7amnlKVC7nmz8LkCXf4PKyyzXoD3s3CBYk2qOq93/7JWsj/Xldml7bg+tY0yBqC4YYR4V66AvuT/6DvYXfv4qC0SmpDluupYUTxkpp11DGZJ9w/NSANhtyu8DQVTnrahYqhFjo9uJfeIwcrATeRpioI9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVCTX84K; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVCTX84K"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48af27fe287so2529029f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 05:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791895756; x=1792500556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WOn8xr8BpKgnJ6Gee1th0C/2r3v4X6hPgJGRiiP13Cg=;
        b=SVCTX84KQfto6of6LOHGl3AqeZAJ+IvR7PH8JEDFO4Pu8f5ibtZGa52ECm+9eZ5q2G
         G9i6uFz6yxKB88p3Ik0eEnZMTiaKmfe2FsP9cnmz3Vm/YLt1AhLv37zDXLBNsKMXmHK1
         OZAH1PUxY1RPUo8d7lLFDJ53rhPQJgHJz4i5InK+TxG+cqK7E60amYjxXbqsbxOFcp1+
         II1+oRL3mRc6cA4czMw/Z+tqS04ofJn1xiJfzP4F4Arqbzv5np3dtY4rsCRn7Mf2kaAl
         w9kOFpvu3VW6Q5hXd/tB+ldamMByklC8+nBXyG53wt4L3Y8EnDvQ+5Th3Bs8DbLnz+Sw
         QlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895756; x=1792500556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOn8xr8BpKgnJ6Gee1th0C/2r3v4X6hPgJGRiiP13Cg=;
        b=MEql8+C8OUu8yCc3+nkFGbuyyvNzfytkz7x5/lRaXd6kK/XdIgT87JVuUYK5NfY8OF
         nZRXeXvr3dthGfqU+KqyJcuoEmmqquFtzEYK4vS597W78YMNqrXCuI2JAmN1C0EfSfPd
         Qv4mFFBAnV7KoqR/6bakDZkXKG1qRAtA5PqUwhtO1QtAe/Y0wEX2vGZT9QY9FUx2CO+Z
         5hF4WyqfQzdovD8AIy6MMRrcMhziQKM4K08tSbdT1wMip4Cs24s44Ffk9SHThuSG/bTr
         uRN6zni4Oxn/IQflimk4SpsBpmpXEsomuaGr0kU9hvWYsHGnMPOQPJA8PPtL4mDmXeuI
         /O8g==
X-Forwarded-Encrypted: i=1; AKwUvBxa2EFkT76YeXY+yWI+o170zVCU0mIVLEPhDAMtHXhqfaSYkkLwEppciyFbZwJF6Hfc33puBwldk2E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDV+ez+jbUxR0X44omGSCjVj7d6Ha7rYnUe3jgFxoy4Xme/Rg4
	svlSgSb08POUZTiPCF0Q0fO9LSKNARiSFlr+0Af0UvDFxKD2fg+tlm6Q
X-Gm-Gg: AYBFou0+JwUUqxGcyxJvuzNopr83FfQe2jptQFADAyGV+F0fdZQSvKDWpx2uPpD+2nY
	9XvrVKK1VYyJm1yB9WafSEcHP1Ud1btp1yD1IzoPPkRFahXEDkJS2nsFlI0+utUo9M5DAM4Jjzc
	RU9nij3nS2L1tZIIcfVnSeWmz8fpJKCPxyV/OaUIchLCcXEygroQoMk+6SKDLY2rEWTB2ke/U+Z
	6cetWSpOceDMeH8D9hOw32Cy9XEFvurbNjGWKm25vOZvOKueCwZuUAvu3vyjvKhU3UrPQwn7PEE
	FvbzbkIDwjyE0k8UWfSCZOzvqBi1DcMvx9C6MVGneiFkW9poHU6/v/C5qp60gJebAhyLZdlCo1w
	EU1oWUeWrKPvLBysPbOFPd7i22aZ1/gN1Qk4o/M6KMfGrAxiAOX3/zXDU/pUIDOkN4iOxkdef86
	r6z5G68U6oixhrPjbvtoOxo5CzoXVXJdIbfvDI1C2kpQnrFhNlBi32iWg+Tjww4o/gjoT8R77U/
	h1nSWdYlN06RpNrQFhgs3BuQfEuJXgqnKE5iXfV4Ln+Iow3mLK1/qRQn56Yhn4dahcPeWLKpVhe
	vFBMUdZx
X-Received: by 2002:a05:6000:454c:b0:487:c3e:8df8 with SMTP id ffacd0b85a97d-48dba77cf87mr16911311f8f.5.1791895755870;
        Tue, 13 Oct 2026 05:49:15 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa05sm4447635f8f.13.2026.10.13.05.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:49:15 -0700 (PDT)
Date: Tue, 13 Oct 2026 14:49:13 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	"Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, Frank Li <Frank.li@oss.nxp.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Herve Codina <herve.codina@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Leonardo Costa <leonardo.costa@toradex.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/7] of: property: Make fw_devlink follow GPIO, PWM
 and clock nexus maps
Message-ID: <xipbz3gva66o56fjszlhioxgprcspwae7dwcqe7snub7wblts3@qqryckq5fau7>
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
 <a754faba-f904-458c-8ddb-7502e684c868@kontron.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a754faba-f904-458c-8ddb-7502e684c868@kontron.de>

On Tue, Oct 13, 2026 at 02:09:37PM +0200, Frieder Schrempf wrote:
> Hi Ernest,
> 
> On 10.09.26 16:16, Ernest Van Hoecke wrote:
> > [...]
> What is the status of this? Can you send a follow-up?
> 
> Frank is asking me to use nexus connector nodes and it looks like I will
> run into this issue.
> 
> Thanks
> Frieder

Hi Frieder,

I'll be sending a follow up very soon and address all the valuable
feedback I got here. Thanks for your interest!

Apologies for the delay, it's been quite busy here, but I also had some
nice chats about the topic at ELC 2026 last week so I'll follow up soon.

Kind regards,
Ernest
