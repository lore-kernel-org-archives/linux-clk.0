Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B599192B69
	for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2024 23:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719445012; cv=none; b=FYx6UH1Yfom1wTQqDdlIeffVOWwg5AWgE1ReYWLLu4LidTYfG3fWlZqKkO6YXRSR0CnzElIsV0GX04vCoZAaWOyM4nl7x28Qqz2TsOA/uxZ2gQqXjp3HgpZv3iZ7/p/IFpWvRU3uoTX60MpFFgsUmxOuThLCgesmxxvr587i+2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719445012; c=relaxed/simple;
	bh=z/wAF2IKsQ5synR7GDt8p9XW7wQtUDuAPAF7D3cS6cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLsVeJfzGlpFAMx+a5J1h71R3rAwxmPoTNkNmzkYPh3dgeuVFOegtfRLvshXemtIiNJVY/sMzCwMPNhsefVdp3lpExzFdGEL/Awj4r+fcyFsw9XyfWy5CRN9HImj5Kq1uuWSz8TQn797e0rnxUKkVMqxDqkQeuOmZfIX7T2Ln7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rt3pnG4M; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rt3pnG4M"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fa3086cf25so33075ad.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2024 16:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719445011; x=1720049811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oH/qUWFW4tGC7M67sX1amiT3vWfL3r4iG1qiqBFOKFA=;
        b=rt3pnG4MJ7hLQhRdM8Kke2tbcSbdYgd+gklTSa72kINn5PK0R4a+z2pWzv5tHutOU/
         ukXyCEqqfjJyjDGKw6OCqn0Se6ebzihvRTNSQBIITxrTr6dCDfT53w4M5+UaI7lJ11gB
         htJ4FiEkEIs04OnKIrkKNrUzcNYamSh/se2/qnm6uhh7VVs6EleJx+1PdjnxWlYW/TAM
         +/cdF0BsHd8UIh3qZE2PMUPrORE8WidmUlQaUGTFJ7WPgRun/zTygQ3wnEhGAsoO5Cir
         mVwNcYxOFQUxPdLjbh6XfzRovtW352xivntqyCaUz+EE7voHeOLDRuA6rTg0Rbw29ytf
         uHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719445011; x=1720049811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oH/qUWFW4tGC7M67sX1amiT3vWfL3r4iG1qiqBFOKFA=;
        b=lvuDo4sqpqHMoghIbRC9axC4Hnv8tOSZ7NGpWOsXPzUj/94QXoPNJMndrWFxErO9r0
         /P/gecRUY0ZsvdQ3wJaJ5r+PZfrxshyBB0JQteVXRQtvn8hU5FG8G2XuzifIMbIDidxb
         175k40MIr27RFKEeEWp+8/eFwYuH8805L0RRAuODUZanc64JZg+Lr0ksBWdV28aWVMwN
         Cvi8C4/id9KSq/vQQH3IubX3N2L9XH0sA9xIexTguhjsyo1QUqwUTZkBODTE91oILc0i
         uuHa28D12X388BtQp/SbTli8FLp6EJpDOj0OzbQucnUMWfa5+uo/4onjSyBe8qWg20dE
         qouQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhrTjtG82pwbLLPXigJ67rjc6nNfwdaXYpeSLjrM54QUC2TtYu758s1tsu6+S5oem/k0dBQUKbNaN+FyTQiHh4aeE2s3mv6M4g
X-Gm-Message-State: AOJu0YxBGkFmmSzBxuWbc4/Z77WT3eWDPD1uhhL/MTRMzdou3WaJzqVo
	I5lt56/AI/0dv3jL+YdeKufdYirdbmE/8P61qe7qeNGtL8auL1vIgXp2S6swSQ==
X-Google-Smtp-Source: AGHT+IGWzunzRKU/pxSD5TKBv4BbD7ipJSDwv30o0P4jS2ap96vNu+qiT1InfYybFnYLD+PBVkyeiQ==
X-Received: by 2002:a17:902:8648:b0:1ea:963e:2e2d with SMTP id d9443c01a7336-1faa999a933mr1481655ad.24.1719445010425;
        Wed, 26 Jun 2024 16:36:50 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac9a75b6sm484945ad.247.2024.06.26.16.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 16:36:49 -0700 (PDT)
Date: Wed, 26 Jun 2024 16:36:46 -0700
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, s.nawrocki@samsung.com,
	cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	tudor.ambarus@linaro.org, andre.draszik@linaro.org,
	kernel-team@android.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: exynos: gs101: add syscon-poweroff and
 syscon-reboot nodes
Message-ID: <ZnymDq5Yzd0oyuIr@google.com>
References: <20240626194300.302327-1-peter.griffin@linaro.org>
 <20240626194300.302327-2-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626194300.302327-2-peter.griffin@linaro.org>

On 06/26/2024, Peter Griffin wrote:
> Reboot of gs101 SoC can be handled by setting the
> bit(SWRESET_SYSTEM[1]) of SYSTEM_CONFIGURATION register(PMU + 0x3a00).
> 
> Poweroff of gs101 SoC can be handled by setting bit(DATA[8]) of
> PAD_CTRL_PWR_HOLD register (PMU + 0x3e9c).
> 
> Tested using "reboot" and "poweroff -p" commands.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks Peter. I verified the device reboots and powers off with these updates.

--Will
