Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4ED370D52
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 14:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510700; cv=none; b=BjMJfCB5mLFlMyuDfN97eq+b8+AFHev61frrKBg5Jp739UBHN28m8SdXQ9tOv0JgnEPz13QXF0QwMOJswOxetCJLg4oL+k94U/k/uQCbdofe8pmHuXd+HKxfP8OAPXz/tq4x598pOWX1vrC549bjsw7UA9Y9Ib/9A798cpTcH2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510700; c=relaxed/simple;
	bh=MFiTN0Yfk5929QM8ZG3xqo3c4QVdL3MMPUViXHHZdag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMmXJd0bUhNTIQ2Qs3IXHWZAQ8BCXFqmTrA45SlWrXlGkHcP66lCXt4KH1T5+Gk+JLKotrwafexXqdBoo9RyMlKuP+P+Fen8mYFNdJL6StlRy2uOdhINOhri/WRb231fz3Zf0WQ1ObnQh0oa74drSpao1wRt3vE0K7s9HZBGMIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I+5KAHlp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UbtGm/Fo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I+5KAHlp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UbtGm/Fo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778510697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FU31spM6LjzcyHuFHmDris1Hu7nsA7C7uZ0OzEouoRE=;
	b=I+5KAHlp8+yv3JdACpupEtPAaer5R3en+mJ5BW/QdJNmNdp/dF+KS4Xvqg2mVuvP4GjZIK
	F3hncqN9/CNuKLmGENGZFgmGZ1aX9wU3DAkrM7jsd5Hpq7GpBIn1Rf1IOuARddwbWRXxBC
	9bF2S0r8xCn2RP85urZgf4pOBTgBBQg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-JQfWAQzgMe-xUZoMoKqDrQ-1; Mon, 11 May 2026 10:44:55 -0400
X-MC-Unique: JQfWAQzgMe-xUZoMoKqDrQ-1
X-Mimecast-MFC-AGG-ID: JQfWAQzgMe-xUZoMoKqDrQ_1778510695
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d84b5f73bso43106851cf.0
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 07:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778510695; x=1779115495; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FU31spM6LjzcyHuFHmDris1Hu7nsA7C7uZ0OzEouoRE=;
        b=UbtGm/Fo+JfWxBIDdzkUFBMjn0FpzbT6ERhgOPmBIBjx+ndX+PSfzbuKdODEZf6OYd
         ywtfWtnKMP15Trsl5ivhWPwQ2dnn7p5MwtiwnQb70ut8up9OPA0MhSD3NdbORf/0Mmjg
         7U5KvN9uZrBxodoRbL/7HnqJMU/veqf4gHcP9wru53rMqETSXSh6sPe6hjEDgzp/kxYf
         MgmxcNFcoBdiedm83deIU6cbUscSh/6KMGTCZQlnf2fAfVPvb9J102tc265XIdhAXrFr
         zFS/JrPbGvbrSRDbLMVZm4MtBpZCC9rqtHX2lll5n9vonTI6Of3YjWOaRC0UeedDNGth
         O3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510695; x=1779115495;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FU31spM6LjzcyHuFHmDris1Hu7nsA7C7uZ0OzEouoRE=;
        b=aFj8piUpf5Ld5dmdxJ9zcjbQ1ui1EBa9nofyGkx5S/eQJ4PakEbDrC9wKqi5o0V5s8
         MYEdUSTYMIyt3f9bpZo0A8U8HuWlc9gBKbX76RVuvnOfjLkRTceSCSLB2FbzmXEd4y4C
         fLH6sczQME6om9PzBxn/59LPYTFfBphtCxknnFRxM6yjzWAELbWEE0rnR3KzpSFqw+XX
         b9Ot4QDeNhenWTm8BHJsE+dkm8mYaK/Y3e5CeqQd2jri3sJJdCCegjc/0WQ6xIEJtb33
         VafgkF3oyxLWNy10+MDY2Fu6m6BP0H4RsM3IVvSUWg3sjwEy+gs/qP+51EAogxN2OsEA
         rYQg==
X-Forwarded-Encrypted: i=1; AFNElJ97XuhVCBCtz4pa0Ck4k9Y5adtqt0qmYmnidKcDFvHD8yIA2XZ1Kc6G8acygTgyZeabZYqqbdEgoDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHakq5ZYgfY+bblkN3GGmnflswrfRZl05x92KWqpRJK+4Lmao2
	lkijEyn5TVwn2d1t/f1idhi+Uodr+C5ZwJbkcLhQrNif601YXxOmU7wVqbmoTZsZABFL4XZ1r3B
	rUiVvMc91CyO/Bci1SJLkYUBRkU+x68b0NBDPMfCNS4On1rRj+SVvMYaAnelHDg==
X-Gm-Gg: Acq92OFoKpg/xqIoj5BPiN89GcDBshHVZzL0uR9yMxeuJ4WYeAxsthW1I2SYL/yTl+Y
	F5SqY+sy1yCpZGpbtgVn8fWWp+u2piaPt3WpQVWKUjInmYSt/RF/aVToLcs9szklT/fzIxID0+t
	7F8s7y0HVz1B1mbO1Ibnj7Y5NjUvNfew9/oN0u3SHgzkruVXQR9TI7IdlI0Ws9WIj5LUitcJ2qq
	PVdFdOIfRlaziwdLtRU6bAWU7VmUCm4LyPOhx/KECx7/U/ldgmZqD+ag+WsnodYz+Nf6GeYOBkk
	9fLLj7Z8s25HNjjmnG8MDKY7asDKwVPe7kgFp1OPShb0yKboFy9++j+C2qLkVz/hOKoo4rj8brQ
	y6g3xwwxkxlE04fjoAlavtizzuOQPLc35bUzLij1+SjyRYY3VLUmRdcGI
X-Received: by 2002:a05:622a:550e:b0:50d:6b06:a453 with SMTP id d75a77b69052e-51461e4fdcfmr344798901cf.18.1778510694841;
        Mon, 11 May 2026 07:44:54 -0700 (PDT)
X-Received: by 2002:a05:622a:550e:b0:50d:6b06:a453 with SMTP id d75a77b69052e-51461e4fdcfmr344798201cf.18.1778510694263;
        Mon, 11 May 2026 07:44:54 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf39c82420sm105737256d6.33.2026.05.11.07.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:44:53 -0700 (PDT)
Date: Mon, 11 May 2026 10:44:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 03/15] clk: scmi: Use new determine_rate clock
 operation
Message-ID: <agHrY52NvBCWA2fi@redhat.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
 <20260508153300.2224715-4-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508153300.2224715-4-cristian.marussi@arm.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Fri, May 08, 2026 at 04:32:48PM +0100, Cristian Marussi wrote:
> Use the Clock protocol layer determine_rate logic to calculate the closest
> rate that can be supported by a specific clock.
> 
> No functional change.
> 
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

