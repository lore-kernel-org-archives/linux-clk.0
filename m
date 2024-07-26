Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF30417C7AD
	for <linux-clk@vger.kernel.org>; Fri, 26 Jul 2024 16:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722011894; cv=none; b=VyTRFjHFLEMgB6mJBwUGLZ6gjx8WNs7zUjudaFKQEedkE2p+CWHN6jVZpM69R7B8CcH+1SJts5bt9UJ6GEdhfA8jA3elJOZkOxD3TlOqHwu1X+/ZlffItmJBXm42mQO8ELsr84aPmxU/1bDrguOLN+u3BG0AKfEuqujA8W2RY7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722011894; c=relaxed/simple;
	bh=EdT0LNcW/fg+/3EqCSqFErM7Ot3ITnnmLAMCTmrP6I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnDp4pr2AFPFFmz3hdnrWGOWK8d50nLFAkN0q3ollRvedDDrH9egjORoZ8Ay4IJ1GD7urS030ZzcvXDUc1hVkpy1wQTB8WfB8luGowv6uWfgX4qBkcnsePJWxrw2skYhYL/Owu4X5xL1DEJ+9Hr+JX+M47PMKjeqsDtNKRdULbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=LN2caqVU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="LN2caqVU"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fc569440e1so7956495ad.3
        for <linux-clk@vger.kernel.org>; Fri, 26 Jul 2024 09:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1722011892; x=1722616692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a0HpN9HmDodrUSDORXqRofIB4AnVMlhB5oPbGsDNiZk=;
        b=LN2caqVU4451DdiX6i4QfOnjg3dGSMeGIxUlre8GSx1JCcC4nx7Emok8jZTfOaJ4qK
         6UFzWawjgCm08F9ztkOl4PZrx4/t5wMuTEQesDzydCNA11+4eKisbRuYs502jOBXqt8m
         tlacK6KfDDt2XfKtQioBFC8vmrOs+OCxrc7DxKZFXagHpsqjJbZLplGwXAE/hZUCnkMo
         uV5FJbVIO02eYttnCnJISB463vdwopBvACmA7bx0Nlzv8kye7v/8rAzJgAPCHq6g8Sg1
         5aJxhQay6pdepFnUs4RA6HfPgmjroRjI8fQYnc9prcJ/DiqBYM28MAc4QqLkHUXHBn04
         Rm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722011892; x=1722616692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0HpN9HmDodrUSDORXqRofIB4AnVMlhB5oPbGsDNiZk=;
        b=tgOX4dA7vIwsLpRbE+MXzGRBY/8sU6Xl9Ib+vzovzwJFMTsZIApeMpZDovK4FOE33X
         cQRlhv4AFS4/DQ28AhWc9Qz/pBU6JD/UCo/cJnoSx0z5v5hJ0SJM4ZVeMMJKWAWDa03D
         I1Ulg0tKmcKE3RUaoroiXVyZzU5CTc1J1LhpQhjWcUIVo5Q+Sa3h0Ej7LlJiEU8POVoS
         Aq5q/DyRt1ut+l4iCNZpQquRPKuxht0zNhj/2DA1k8W38MqI0d3de7Rk936yhF85fhbK
         +5owAYhYquxHh1nhPOKMZBQVzb91G6ZiyapW6Ws9XkbgQDvl1ucTCjZxavZinolF5yyT
         Iuow==
X-Forwarded-Encrypted: i=1; AJvYcCXGIuNgF4AuZCQdxI2QzqTKIFnRQ4Wfp8RM0nEYGy9NsFL8K65nHv2eBvJwagjFwT+dBvxVLPgRy3r2G4QL2Qt8KpHKt0lgJItE
X-Gm-Message-State: AOJu0YxMIZyyIR9GsHDgMmN+BEx3h3nem9vbk9OOLMf1bTXTKPtvyHq/
	xOkYxGRts7ERmHVWQTPAywlLe9nEvOOWxMnwr42j17zFsgwnqUc/z0JYNKutP64=
X-Google-Smtp-Source: AGHT+IGgSdGMTreHVjBjvhyywbGtPKuHA78vW4E4X9Wxkh8LiuFv+1u6kKBI9jhD+IpTldIfmpl/Bw==
X-Received: by 2002:a17:903:234d:b0:1fd:80f0:e859 with SMTP id d9443c01a7336-1ff047e4564mr2287615ad.2.1722011892159;
        Fri, 26 Jul 2024 09:38:12 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:dd1c:823c:f5e3:153f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7edd91asm34682265ad.131.2024.07.26.09.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 09:38:11 -0700 (PDT)
Date: Fri, 26 Jul 2024 09:38:09 -0700
From: Drew Fustini <drew@pdp7.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <dfustini@tenstorrent.com>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Yangtao Li <frank.li@vivo.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: Document T-Head TH1520
 AP_SUBSYS controller
Message-ID: <ZqPQ8X51S6PrzQxI@x1>
References: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
 <20240623-th1520-clk-v2-1-ad8d6432d9fb@tenstorrent.com>
 <57ef2eef45f2de15e6607da266b37b2a.sboyd@kernel.org>
 <CAJM55Z8iF8yV5JK5v6ZtQqS5AaWwCZ7uwhSYb7hdxh0juDFdqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJM55Z8iF8yV5JK5v6ZtQqS5AaWwCZ7uwhSYb7hdxh0juDFdqg@mail.gmail.com>

On Fri, Jul 26, 2024 at 03:45:36AM -0500, Emil Renner Berthing wrote:
> Stephen Boyd wrote:
> > Quoting Drew Fustini (2024-06-23 19:12:31)
> > > Document bindings for the T-Head TH1520 AP sub-system clock controller.
> > >
> > > Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
> > > Co-developed-by: Yangtao Li <frank.li@vivo.com>
> > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> > > ---
> >
> > Applied to clk-next
> 
> Thanks, but this driver seems a bit incomplete. With this applied the Lichee Pi
> 4A no longer boots without the clk_ignore_unused kernel parameter.
> 
> /Emil

Is this the case when you apply the dts patches from this series?

The dts patches won't go in until 6.12 so I don't think the presence of
the clk-th1520-ap.c itself in 6.11 would break existing systems.

That said, I have been using clk_ignore_unused. I had been thinking that
made sense because the full set of clock controller drivers like
AON_SUBSYS (always on), AUDIO_SUBSYS, DSP_SUBSYS, etc, are not present
yet in mainline. However, the T-Head vendor kernel does have drivers for
all those clock controllers and I was suprised to see that the vendor
kernel fails to boot when I just tested removing clk_ignore_unused.

As for clk-th1520-ap.c in mainline, I'll investigate further which clk
disables seem to causing the boot failure when using the dts from this
series. I suspect I may need to add nodes that will cause the necessary
clks to be enabled by their respective drivers.

Thanks,
Drew
