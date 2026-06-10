Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A3C21257E
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 13:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099698; cv=none; b=uRUnht0TJHlh5VucP2DsX3marFzPLtVdFC7ijpt7H9aRm2W3VyFUfgbmSNDRn4cH8qAGO4XOvVzi3t0I94JW1mccHOYsF56Y1hcwYuYRZKceM+VAOC+GB1drm5ofx2MsR4S2uDFMNrjNSg8amR4+CStpgJcm2xvp5C0i+x6zKpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099698; c=relaxed/simple;
	bh=nPc7AzhItTqk4bLFJr6RbsgJt5JDwnD68y0mSQc8P9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i45BPRt8kniLQS2iknZkz80zmVbTA374zd8bRgDE3Q99Is8a8jMCvAqsIcOofHsq3DY3aKuqXJFCWbSjogBDWxHoPZXTrpxYHvmS/1f+3KhNAeUV/nA5CMRHsE4WCMSajz2pPV1EIqF4ip5SCPzGj0ucED3QukzmI3KZWhfwewo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IpY+qJTh; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IpY+qJTh"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so4755587f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 06:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781099695; x=1781704495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m05e8ZK6LdKO8zCgzV0KxhPr/bGmY3Qs5lVi4T+Cols=;
        b=IpY+qJThfWXaFqmNeRC927cnh8tv8qdQjgcFujMbVA73Ou7CXXYJL8TxbV+zLF5gtB
         C2vLYi9u725R/DHg43F68IJN4Pl2LPSNNkmb5lmfjApgcRLscghFXF2UZLOJ6nuWwesp
         MmyO7qSlXr2gN5lZESkEV1nM/TEbDuOL22l3n6eRVjNxlygfrQDg6iFH8peEaTUSuXyB
         QG5te0qr1KSY2WruOFyn5UYgM4ln8qNa+pJwbSW5CgJ6qeDKUN2lf7bl0Ox6cXb+Jev3
         0vb03QfPtBONlALEHxo0L3Y0f0Udj2aXTErqxe/0AoISkklhoiUbODdqmXlLNAapHxec
         1gFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099695; x=1781704495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m05e8ZK6LdKO8zCgzV0KxhPr/bGmY3Qs5lVi4T+Cols=;
        b=HBgbQOrOKuCuj5+PCxNvRIYITtJBv4VyHEFXhKWpME89MCjWM2Sih+dVdmFX7h+6ph
         1FAn8YEhdOOqkodco5vjWvG4pwWWf5Ueq5T1Znzmw6xT/MRb+oF7jvy+j1yRp2tpa6QL
         KvNKvhi/jgjfk22MFYXUAkLo8k+niSTZI35r734ELFXdNmL3tsl1dAQFqeOc9df7aBf4
         Fuxh9YSZHpM0u5fTVu+H7uEY++Z23KiwCYdVN39gKrJwdymYoI9+n68YtvSOIS2jhS4q
         Oonu1SJ+ajPFyfbhOOsTybVXsRKxlVEf9cAhMELmsLzOfZpBCSLEyrmhCsqaJCmLnN5D
         NNpQ==
X-Forwarded-Encrypted: i=1; AFNElJ/CiqiN5Wf9rsj1D0AK6xUwOTj6YCzS6bJyRXoY9YEoDw/8knXKOi5gXC9pr53M5JGhQNLGzrKdqg8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlRjleuR/bmBXuWNu0g5sSdR2vsyUm/otvS/LAc9b7CkGjC9i8
	y0mzd7S5X8V2/dKPV5uxJrD95lzn5ecQOJOhC9V+CWgJfukPHnt6N97+EHfed1Eloi0kO8IBFK9
	mhcP5vG4=
X-Gm-Gg: Acq92OEstqkGO/YtuaWVkV5YjgDeowZuqmYJEL1WZ7DUj9BXL42jIMIn/ib9V53y2Oi
	kyAGe1zSZgC+rKsGhdpdrulNkSAfhbTv4oFVmhLJF8UXXlK4Xn0G/wScbpcMn6cD88kElNlCdfB
	cLWE18TXjiEP7TDckjiKF0uxXQHeCnFTOgPQUWx8ud+qTD40C7bTJTJjUeA1HD6zBrzZ/FrOhoC
	uo8yz3hHAnKL94HKX9FsL/2OQgsC87wZ1W9Uwa5n5imBjOEv+7M9pdS7VPHe1/H6fuMLsrsjVfy
	BmwgA6qlR8NEbiQdPPod93Mh2GWPkeBAsNmJGYwWFEBAZYh0BusbHsNaO2pp9WLrPrXtHIh9qhl
	6iozOWK6U5KVokqPr0JQ83mUFBoMTW/gdPhgZx8UHMLUQrjQdawWMhWgJypTtMxR5vuZlhFdmQc
	Knfh8DZbCso5vDxXrw4Bjqm1dcCTU9bxDbAv8wLtBZ+3z40DftKhrfj0BmoQ==
X-Received: by 2002:a5d:6910:0:b0:45e:f073:d2fd with SMTP id ffacd0b85a97d-460302ec5b8mr28252555f8f.9.1781099695344;
        Wed, 10 Jun 2026 06:54:55 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4441:7c57:ff85:2733:9342])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm73006149f8f.2.2026.06.10.06.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:54:54 -0700 (PDT)
Date: Wed, 10 Jun 2026 15:54:43 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] clk: qcom: Add sane defaults and drop defconfig
Message-ID: <ailso2RrnKPUtwhI@linaro.org>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>

On Tue, Jun 09, 2026 at 05:32:34PM +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Significant rework:
> - Add more commits, also for arm32 drivers
> - Split defconfig changes to separate commits, so clock can still go
>   this cycle and defconfig later. Also, less conflicts.
> - Link to v1: https://patch.msgid.link/20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com
> - Dropped most review tags, due to changes.
> 
> We should not be really asking whether to enable clock controller
> drivers. This is obvious choice.
> 
> And if it does not seem obvious, then consider [1].
> 
> [1] https://lore.kernel.org/all/CAHk-%3Dwhigg3hvOy7c1j1MXFy6o6CHp0g4Tc3Y-MAk%2BXDssHU0A@mail.gmail.com/
> 
> If the approach is fine, I will do similarly with inteconnect and
> pinctrl (and maybe others).
> 

Perhaps we could add some option that disables the defaults for users
who need to compile a minimal kernel for space-constrained systems? All
the clock drivers combined can take up quite a bit of space because of
all the clock definitions (a quick test suggests 2.6 MiB on ARM64 for
all gcc-*.o), which can be already quite problematic e.g. for MDM*/SDX*
systems with sometimes only 256 MiB RAM or less.

The defaults applied in this patch set can be individually disabled, but
this becomes quite a mess when you really just want to have a minimal
configuration for a single SoC. Whenever a new SoC is added, you need to
go through all the menus and disable all the new options that were
added because they are going to be enabled by default.

This could be easily solved with an additional option, e.g.

config ARCH_QCOM_DEFAULT
	bool "Select important Qualcomm SoC drivers by default"
	default ARCH_QCOM

config ..._GCC_...
	default ARCH_QCOM_DEFAULT

Then you just need to disable that one option once, and all future new
options won't get enabled by default. The media subsystem has something
similar (MEDIA_SUBDRV_AUTOSELECT).

Thanks,
Stephan
