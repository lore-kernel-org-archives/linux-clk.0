Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799C41A724C
	for <linux-clk@vger.kernel.org>; Thu,  1 Oct 2026 00:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814971; cv=none; b=L7lVb2KeVBnX4osFB0JNownbWVlM2kw/IqeGJnQN0OAXm0Fo6sv71gapxmFieSq8kiiwlxliF9esBVfA83wTX/hGiRaY5Swry2MxkcSwEqznvy7IT48+PurY7yAt6Np/8rnufb+dUwbRzA5DPm2LXQTnI4zYJiTXzBbyFKfistw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814971; c=relaxed/simple;
	bh=mEiOxK6qgL2knbgWwksX7Taq8hLellRiYQOPrC1ldZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5u0xolFEds2LgS7y1xj8ZRaAyxz+LvyY027TARXc6X1wuGez8kbSk1D6ugt270egn9ihCgi/0zz3HADkBBkZKyPUnqj+zVVPDDo32Zo8KV25tMVjtqGo0ajwc8husr3NB5U1QI3v9j5gIBEmh/3uuaupILB1Cq5Xjzpb1k6lkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CdO6XnWQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qIQZSosw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CdO6XnWQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qIQZSosw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790814966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YsV5MN4aFpGUFvwk6vrhGH7My89v8MB96omgdQVAOpM=;
	b=CdO6XnWQtublw8+NsoRQljqcdY6oVACGKb7CQEUdxd0f2yM5aOYmuWxteAic9INbqD2cbt
	Lyfwu/20GdXHxP9SUAQU7/5zU+jxOyJqcsTX8tdNSDesili5ffl4J7hl3B+x08U8DUxJ9t
	Va/t9ZuK/wUH4NywO4swlGsvug0YAXk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-Mf37FK_ANf6Vgexc-zsD-A-1; Wed, 30 Sep 2026 20:36:04 -0400
X-MC-Unique: Mf37FK_ANf6Vgexc-zsD-A-1
X-Mimecast-MFC-AGG-ID: Mf37FK_ANf6Vgexc-zsD-A_1790814964
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-916cc44720aso65680266d6.3
        for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 17:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790814964; x=1791419764; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YsV5MN4aFpGUFvwk6vrhGH7My89v8MB96omgdQVAOpM=;
        b=qIQZSoswFTsxcrn/PhOSvYr083RaQMmNUxBxLateoYBMR/oevPcpwykVYd5c1Kp/PF
         pB0sTFglbT4tn8nkaryxPtQdAVq4+7KI3qw2xhFFkWVBUWa91KUF7y7Z/2IS9axdRIYK
         CIrvHyHmUqpetVr7TPifBX33C7yDT+AbBkoWRa3w6Rvhqo9CeqekngNnp8ROQY5oNAFh
         9681mI3pg4wKHaBpj5u2i4IJcOgvsNhc3OoaSI3HHsU37yGqB90MvOTpqSzPKykqxU+t
         L3PUbP8a/2tuTW2BhC38KCy3vaiB1ST8wLPTvSVH49twgRPZOUeGEc/q95D0M6IxGh2R
         TXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790814964; x=1791419764;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YsV5MN4aFpGUFvwk6vrhGH7My89v8MB96omgdQVAOpM=;
        b=NyLHFAAwS6+2bTV74DIpb4JIa3nvpzlDZ9hHaxppUxK9EjfoOW5/WzYVoq/2EZOf9T
         /d6pimd6S/oj7bExDljScwEyFKulrmH/HfMu8dxuv831+WF0vRIQGAZH6qsWdohJDtMZ
         EWeCUn1Blj+nF/+jLnKezazvJuzKFH8GdpJ2wxESY8TNqNbQNu8S6NAff8QcmvsIfLMe
         d9QjVMioV3QjgatHICjDGdJVO6jBC9TTz4SRQuZBXXUSTs36eFxo0vUftzOvtTo+N8aH
         o2BtdqKhjUJtnVK56mJ0oPd/qi81g27MsIB8mbNDXY5Fgzt/zk2XglCDvDoHUI3B+Hhw
         pkAw==
X-Forwarded-Encrypted: i=1; AKwUvBxotVe2TKjUhmpOeTokQHlLFqmEzqJ/NWn0tUFJXKzqP3nEvL893mE8EPJp+a8jrgrHFq3Y2bjKwkU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1DtsjXbbxI6tB7j9crvK1anUxc3m0pLMBCfKoSWd+7YzqR3yf
	TqDK9bFeXod7WSR5EdNWtw8cPnSEO4kf7WbPuGkzDJCJYld/wX+lt9Dv3a0GI/9BpdDDc25xNEo
	ZAEoUw+dVpnLO0LnULQPtWKGV9CAE4BsOZCZnjXudxUXx3v0gjrNS3SQs9YSG7w==
X-Gm-Gg: AYBFou2SX5fl14fZNG5A229TbTB4fC99KuHtW40UTdzuZieRsrGgwDIaL1sm9Rp9CuP
	92BZ4QJdzrRDz527dgaEHNPxC64Sxmfn/n8m2RH94b7Bg/dwpbhjhuJ6o4UOXIRCor2z9SHSnBT
	BDsdIb3GyS/z8VzyKioXbmCrq3xxSRYb6YsWFIHgiUL8zy+zczg2vCHca42VrUVSg8m665r+TCZ
	EuwucmARdyn0sqPY4OUbsJqw69r6CwMH2GDKdXYC4tl6UnsHMNOMZZObgrJGg74I+imb1dRSG/i
	y+yAVLNuRt3S8GxCXQ2U8IaKxlJb3BaNzSP+nle+y2UOA2vb8ChV7C4TEEpnCEosYQyXTcJlj11
	bOUw/QjnMMitkOjJJPgxyjZQizw3NEo2BKvI=
X-Received: by 2002:ad4:5aa5:0:b0:915:e58c:9036 with SMTP id 6a1803df08f44-917a0a02e72mr59189416d6.6.1790814963534;
        Wed, 30 Sep 2026 17:36:03 -0700 (PDT)
X-Received: by 2002:ad4:5aa5:0:b0:915:e58c:9036 with SMTP id 6a1803df08f44-917a0a02e72mr59188656d6.6.1790814962863;
        Wed, 30 Sep 2026 17:36:02 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a881aba3sm12432406d6.2.2026.09.30.17.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:36:02 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:36:00 -0400
From: Brian Masney <bmasney@redhat.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: (subset) [PATCH v14 0/4] Support spread spectrum clocking for
 i.MX8M PLLs
Message-ID: <ar2q8M7Sn9DccVBI@redhat.com>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
 <179070048452.199845.10870046832708018931.b4-ty@b4>
 <CABGWkvojte=RG=BJ=jvcq5HfUcYUZNsWNN+c5zDh-449VJ8Svg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABGWkvojte=RG=BJ=jvcq5HfUcYUZNsWNN+c5zDh-449VJ8Svg@mail.gmail.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

+ Sudeep

Hi Dario,

On Wed, Sep 30, 2026 at 11:01:28AM +0200, Dario Binacchi wrote:
> On Tue, Sep 29, 2026 at 6:48 PM Brian Masney <bmasney@redhat.com> wrote:
> >
> >
> > On Fri, 04 Sep 2026 12:06:29 +0200, Dario Binacchi wrote:
> > > Support spread spectrum clocking for i.MX8M PLLs
> > >
> > > The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
> > > PLLs (audio, video and DRAM). It has been tested for the video PLL on
> > > boards using i.MX8MN and i.MX8MP.
> > >
> > > While at it, it validates the spread spectrum configuration in the clk
> > > core before it reaches the providers, and fixes the i.MX SCMI OEM
> > > extension, which converted the spread to the wrong unit.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [2/4] clk: validate spread spectrum configuration
> >       commit: 109124b8ff43fb911d5b8790bb5e4c5684f72d88
> 
> Thanks for picking up patch 2/4.
> 
> I put the two fixes at the head of the series expecting them to go in together.
> Am I missing something for 1/4?
> 
> And how should 3/4 and 4/4 be handled?

I can pick up the other SCMI patches, however I am waiting for a
Reviewed-by or an Acked-by from Sudeep for the SCMI changes in patches 1
and 3. It looks like Sudeep wasn't CCed on the original series so I added
him.

Abel is the maintainer for imx in patch 4. I can take this as well,
however I'd need an Acked by from Abel.

Brian

