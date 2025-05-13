Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56D820D4F2
	for <linux-clk@vger.kernel.org>; Tue, 13 May 2025 13:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142232; cv=none; b=l31jObPvQOohhcNEmmedyX9jIAvDsXWdYbNSAdrygSwGLH/iuL1MSolyW6oDQwJo8r4vRDoJdCh3geAdb5eEflR5R2r9i4HSs/yaWVeNVbkktr/tlqylQkWil2mmVsSJUN+0G/8g94DHYNVqtbp49DvNU7I3/2QNvyHS9l2kZaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142232; c=relaxed/simple;
	bh=HCxtUhV0n5ObKOhNbl1mM0TaQS12Gee1diWbIonF2TM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InUtuyxtqMbR+m44clRVaydK/EJQQkZvNJOqHqH51WxUcNXggcDazjiWWKLGaWWgKU+IFmgb1FxduCdS/56/oRTHpsij2cydpf2hxyavYF/jZXcm5pgZNikmIwbx84YsrdyUYOpYBE7OUXSUkYUZrgNOoXmGX2dtagSsBEIhjNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pRULYFbC; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pRULYFbC"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so45470925e9.1
        for <linux-clk@vger.kernel.org>; Tue, 13 May 2025 06:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747142229; x=1747747029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fSKROeG6WIpVx9D960CzNibMdBJ6VLFhrNLL+i7WoQo=;
        b=pRULYFbC9AVSyNz2e360366ONMG75W4ysygYHU7YSQxD2xdrnJZPMDutdBHmuLpD/G
         xhhnr6EJzCIrl0S7MLCg6fsUSJ5cjG1XIVJqKDHcT+lDqt6WidgHTeqpeMmY0YaLU+Ja
         KnG3rfvc3f5rr5z4L/MPVji6Q3XMGh+5j0dwhui89ccMHrCRiU9jiunTyA+KCwne0etu
         TpxwFAwgZpMH8UemlzHJsfzeb6gqqNA2jd75NAaOYBg6N5x/UKdytHLOoGGSM6uammZ1
         OH4JS2pg1xAz6QAl2pAYlHIyqu9NYUmwWs9uPyDoXGgxFB1vV6mzv1fBad3RGfcFEnPb
         YPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142229; x=1747747029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSKROeG6WIpVx9D960CzNibMdBJ6VLFhrNLL+i7WoQo=;
        b=AriBzMDBAzQ2eRZHBTYTG+ofdBqPFVk+bDZ3LVoPf6SAOx6yTQxyx2dg9ml4lZBi8k
         dOLVJsTLxO+AhSQIQil29ANVZBIfZYXngDTrahg0gh9pnjshGOJkGcwLmMMw1px/UpeY
         3zrfCPQXhXCp2pf1H464bKDQ+Pp3GXx0Qv/tfW6baGKe1yZS+G5/sOZFGyKzGZyseVij
         J+XzoDdCX1cAe/0FmRx1KkdCG7x72IukifkmOCzZKdZIPnvNW4gQC6MV86e2ZRtyFqOB
         51qtXuJTYrPqcwCtdzS1HgQIXJ+CyA2SzneoOMUpSP9bYI5MfoWcXrRur4XDbUPuKhZm
         DQBg==
X-Forwarded-Encrypted: i=1; AJvYcCVbq4Lf1eGnCblspQ1bwt9qYDyVWVGIDZGTTW5DD9PmzsT59GRz6vJGOj1uNiM8YjTEamjSuCCsJ2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGXk5L98OHIgerIaugujBEkEMQAyTWeNKzzFDnKxnAViU7oFWx
	aI1D45GGKKmCB8Dbk4mi8F/1/0edLstx1IWeWfmNHujoGPi/+s5Hfi4cyc3xo2I=
X-Gm-Gg: ASbGncuCbdQ30sSAQtfs5u5YxDqTawiqtFY9cVwpESFa0VwhjYkZbomUBqDJzqNRAw7
	A5BjGHCS+hViATt0QhkcImYJZqGPIQrEPm0FibxRqCZC90JL/aqP23u+DDx9+V66/rqfa1f0ife
	+pGwOL/6eTqo/IGnnWCtntUvW5mZle3ZbV2xZPIo9/ALOQNnr+F1FRzCx4FHcEU04NOKaz1ihlG
	13nv4O3X5/VXE5wr2YmJ4GE7cWODYQzWFJvxZMF75wqoJOvW6H5F3gjYxBXaxfqmp0rV2CJ2dNI
	4n6tBbzpdB/2/WjFcYPwEYuvjDwv20R8rEb6o1EsXk/pxyoZ9VD4boGs1DlPrga4sDUeRiQ6g2h
	0rd5oK8ak5w==
X-Google-Smtp-Source: AGHT+IEXNErNLH6JYcRZtXPTKbltNSbK20Unh3nfkeGF/m82+yZaCLAyjteYTaGHlJ6/REhSJrcoqw==
X-Received: by 2002:a05:600c:1d86:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-442eac9ddb4mr30238655e9.4.1747142229046;
        Tue, 13 May 2025 06:17:09 -0700 (PDT)
Received: from linaro.org (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebd47d39sm18740035e9.1.2025.05.13.06.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:17:08 -0700 (PDT)
Date: Tue, 13 May 2025 14:16:59 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: mailbox: qcom,apcs: Add separate node
 for clock-controller
Message-ID: <aCNGSwL7043GoJBz@linaro.org>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
 <20250506-qcom-apcs-mailbox-cc-v1-1-b54dddb150a5@linaro.org>
 <7vszdea2djl43oojvw3vlrip23f7cfyxkyn6jw3wc2f7yowht5@bgsc2pqscujc>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7vszdea2djl43oojvw3vlrip23f7cfyxkyn6jw3wc2f7yowht5@bgsc2pqscujc>

On Sun, May 11, 2025 at 05:48:11PM -0500, Bjorn Andersson wrote:
> On Tue, May 06, 2025 at 03:10:08PM +0200, Stephan Gerhold wrote:
> > APCS "global" is sort of a "miscellaneous" hardware block that combines
> > multiple registers inside the application processor subsystem. Two distinct
> > use cases are currently stuffed together in a single device tree node:
> > 
> >  - Mailbox: to communicate with other remoteprocs in the system.
> >  - Clock: for controlling the CPU frequency.
> > 
> > These two use cases have unavoidable circular dependencies: the mailbox is
> > needed as early as possible during boot to start controlling shared
> > resources like clocks and power domains, while the clock controller needs
> > one of these shared clocks as its parent. Currently, there is no way to
> > distinguish these two use cases for generic mechanisms like fw_devlink.
> > 
> > This is currently blocking conversion of the deprecated custom "qcom,ipc"
> > properties to the standard "mboxes", see e.g. commit d92e9ea2f0f9
> > ("arm64: dts: qcom: msm8939: revert use of APCS mbox for RPM"):
> >   1. remoteproc &rpm needs mboxes = <&apcs1_mbox 8>;
> >   2. The clock controller inside &apcs1_mbox needs
> >      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>.
> >   3. &rpmcc is a child of remoteproc &rpm
> > 
> > The mailbox itself does not need any clocks and should probe early to
> > unblock the rest of the boot process. The "clocks" are only needed for the
> > separate clock controller. In Linux, these are already two separate drivers
> > that can probe independently.
> > 
> 
> Why does this circular dependency need to be broken in the DeviceTree
> representation?
> 
> As you describe, the mailbox probes and register the mailbox controller
> and it registers the clock controller. The mailbox device isn't affected
> by the clock controller failing to find rpmcc...
> 

That's right, but the problem is that the probe() function of the
mailbox driver won't be called at all. The device tree *looks* like the
mailbox depends on the clock, so fw_devlink tries to defer probing until
the clock is probed (which won't ever happen, because the mailbox is
needed to make the clock available).

I'm not sure why fw_devlink doesn't detect this cycle and tries to probe
them anyway, but fact is that we need to split this up in order to avoid
warnings and have the supplies/consumers set up properly. Those device
links are created based on the device tree and not the drivers.

Thanks,
Stephan
