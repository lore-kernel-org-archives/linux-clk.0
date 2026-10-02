Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D705A3B4E83
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 18:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790965829; cv=none; b=KMMCU9tNGx7V+M1HgrBAp2mV6DltZS7LN0pZaXWFiy/eYKzmBao4xL9M/JDT/j6pzQVUwPV/b6SqH7VyxuAnviwkzvVUcvxdKwovdbKsGXNnmp4HUA0TYdltl8WpwolO0wUV8arkZAvM/fZJqlqA7zCX2UmsjHWcuUkjm0xUw6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790965829; c=relaxed/simple;
	bh=a9DGLc0NeseciOnf2q1+7VtYJ5eoK8nd7Li3zgPWEig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnBk3ETZujhw366czLUDw/+l94VrZq1ZDvYQjCZ3+6qHk+xnK+RUFll1InHy0RqwxTe3FMjZvBa5G5/kzq0sn5LA7yGpTW+9FbtNM9uwBXkoUnM0pHn/c7a4+FZtNkhhWoaa9Fno/mFUR0aUHYcrRdhGmM/EsIOWX2yciAlmy4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U6Qt/bVj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=noQAJ5Be; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U6Qt/bVj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="noQAJ5Be"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790965822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yHtc6IteGKWmX+tDrjk0Un6qMA2HmnuYgSyxy+UifAQ=;
	b=U6Qt/bVjv3TQ6uREXXDi4LgRzuCAulcFSaRLbB6Yw8Mx/bZ9ZiRtAfbI007j/IkMifObfS
	EhUiYpiquzKI1ckQXS1aL1xCft5Zj2S/ZyEsp1rZuzRnjsad4rjs+0yOWo3wWHy+pY2IVP
	405OIDu96/uDhXXOZF5nC+1XdA/ifHs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-cilnRvTFPxijJrnIVt36Lg-1; Fri, 02 Oct 2026 14:30:21 -0400
X-MC-Unique: cilnRvTFPxijJrnIVt36Lg-1
X-Mimecast-MFC-AGG-ID: cilnRvTFPxijJrnIVt36Lg_1790965821
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb6391e89so485956885a.1
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 11:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790965821; x=1791570621; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yHtc6IteGKWmX+tDrjk0Un6qMA2HmnuYgSyxy+UifAQ=;
        b=noQAJ5BeGcuvyeXWNZmCjyRtHExIBONitZxf1rmnt0vgdLFEQZBq8f5wNIZILt9fID
         sMeBWfodNEEvnrXbRPkMjMuwsYHvoONUIrNL+TVhSjDgrBZQLnKtEF49CgAAi2db9uf5
         sZlMaZdJpL4Dfnlmt8S2sV4d5ef3us8tNUlt8+n4M84lzcSDMiG3GxNNQOgyRJeZE+C5
         FELLooCwvew0M99z2fi6YgBjZvSxl2A2gL5Y3lhB2FPBeX+grD/X7I8eFF1TwGbTvyUd
         elbn/SrdvNtHFW6wYi7QCgQWAAb4SGj+XDif2eaS6JlVLhIdEZ4jsHxw9HQ5N7KSZ8An
         1JVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790965821; x=1791570621;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHtc6IteGKWmX+tDrjk0Un6qMA2HmnuYgSyxy+UifAQ=;
        b=VQnIBQP3vgpPgz8imZh1vdy3HSiGwXTU+/VsmIT145ISAZZNQPz/E9FVSQh7PCOHC+
         8NRWH8R0FsJZdHw6VXJbqeeXnmDKGvu6gHYvyrYuCz5v2lxuXckooWWVX1MFg8JNLdf4
         wgM8jUhGAx1gDJvdcC2MtS/oqvVrqrguqPYBaypYufs1eMvgnEHv/Fspb5k1eAqbfMTm
         5iHz0sNRrISG8qRSKmqaZnIw8FlLmxnxXsjVZeUnSLQoU8j57Pxe0AI1ufoppztySAFU
         co/tQwFmOHmZ8vz5Ma8T+AqjuqSV9tKf/cgu3CiAIU9vZzIX3KNafLdRD3rkUtU+b7Kg
         62AQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2YWkGOgEQ1e99ly9kUBy9HzDhsDfbgS8us2iaSooBOuAkPeI/In5zKztFIOK1KdM7NoZzAet35ro=@vger.kernel.org
X-Gm-Message-State: AFuF++lr5XHiT2wyFG5KX/RG+yyYPd6jMU2k4eEzg7kiVufUfZLcL9BD
	uYgF3dlMfQ76c02n98Dns2M9zrZZSXLdq7bDVrZYZ1cb1/l5lQDvLmp6mHyGl2xZMELe7IKTavi
	oF56xmuMaQfGOSehf9J3euBSOVUhtDuB9j50lU4i6QpTxtLLNBPa6rLVnEMQLyw==
X-Gm-Gg: AYBFou1sP+BXm76XqH2N1FPv+d3BO2OVKkBQCALXTNQz73O5KH6uTfusY4L2ldiFRQz
	usJdUqW9hnOju7lpjIYzIs8Mkfzp0Mae02N+GbVTcxMxT/+qKQBK+OZX0FMccC/wBky6L9sZtLe
	fyPlSO2EPquPYD+egOJOtl6UvHh/NnSDN8U2eGxHEVA2YJ6aiJQz2mc6XtKjlcmhPvGKI+9zK53
	uHzIYc0xZtSPDHN4D2e8iS1JF50kVR9ID19CwAxIWU+9UY2veyRW43yPx9J15wcjyt4gh4LsRmn
	P5BkaTRcPLiDQ3JQk/IsbyPO1142LENjuvtJPKZLhi3GViBn7pd4d0y2jtpijdGqlNyRCglQrQ=
	=
X-Received: by 2002:a05:620a:31a3:b0:930:9091:f0ce with SMTP id af79cd13be357-93cf16b3b8bmr674462085a.22.1790965820535;
        Fri, 02 Oct 2026 11:30:20 -0700 (PDT)
X-Received: by 2002:a05:620a:31a3:b0:930:9091:f0ce with SMTP id af79cd13be357-93cf16b3b8bmr674421085a.22.1790965817184;
        Fri, 02 Oct 2026 11:30:17 -0700 (PDT)
Received: from redhat.com ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca0395dbsm285252285a.5.2026.10.02.11.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:30:15 -0700 (PDT)
Date: Fri, 2 Oct 2026 14:30:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>, Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-hardening@vger.kernel.org, netdev@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 00/23] Add basic clocks and resets for JHB100 SoC
Message-ID: <ar_4NBLHrq2W7_vc@redhat.com>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930-grafting-undertake-ff3e01060284@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-grafting-undertake-ff3e01060284@spud>
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Conor,

On Wed, Sep 30, 2026 at 11:43:22PM +0100, Conor Dooley wrote:
> FYI clock folks,
> 
> On Wed, Sep 30, 2026 at 05:42:54AM -0700, Changhuang Liang wrote:
> > The JHB100 SoC includes CRG (Clock and Reset Generator) for multiple
> > subsystems:
> > 
> > The JHB100 SoC is divided into multiple subsystems, and basically
> > each subsystem includes a CRG(Clock and Reset Generator):
> >  - sys0crg/sys1crg/sys2crg/
> >  - per0crg/per1crg/per2crg/per3crg/
> >  - voutcrg
> >  - vcecrg
> >  - gpu0crg/gpu1crg
> >  - cpucrg
> >  - usbcrg
> >  - host0crg/host1crg
> >  - pcierpcrg
> >  - husb0crg/husb1crg
> >  - husbcmncrg
> >  - husbd0crg/husbd1crg
> >  - npucrg
> > 
> > In the current series, we will only add the following CRG:
> >  - sys0crg/sys1crg/sys2crg/
> >  - per0crg/per1crg/per2crg/per3crg/
> > 
> > The remaining CRG will be implemented in future series.
> > 
> > This series depends on the series:
> > https://lore.kernel.org/all/20260806122553.182449-1-changhuang.liang@starfivetech.com/
> > and it has been tested on the StarFive JHB100 EVB-1.
> 
> If this revision of the series is acceptable, I'd (although I'm not a
> listed driver maintainer) like to send you a PR as I've done in the past
> for Starfive stuff so that I can get some of these binding patches that
> contain headers as part of a shared tag to be able to unblock a bunch of
> the soc tree stuff. With conferences next week I understand that, with it
> being -rc5, it's probably this doesn't make v7.4 but I figured it was
> worth getting my intentions out there!

I am going through this series now, and I have a few minor changes to
the clk drivers themselves.

Feel free to send a pull for the bindings and headers though.

Brian

