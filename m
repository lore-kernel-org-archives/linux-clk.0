Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C1031A561
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 13:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761311555; cv=none; b=grrDpK1xBOdDISSjwAud/+X/iPsqX4Cm8jjXUS6CKwAx6URmDQwAS+O0cyfIdiDq9rm2zpR15qgw8/ZBLmtioLZMTTd4+bcWqyy++2fPYvSlMsnXURVE1GZvBMDwcRbl11xV28nYh1Bax+TvhujY26uF1Gx4MSzbdPEEHZrbMmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761311555; c=relaxed/simple;
	bh=OKClficrmYxMDAQrUO1h0eLa0MMRKmFd9IjAbIgxwhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVC9QnLUFEbX44NO14LliwC1YN2SqXh4KgHfECFvl1iRm595SyHz6vrMkjJfWBg0wkxpYScCXkuMgVIh1mQEyYcGlOwHPpZ8VTgJ1juLiL7TjTMx4w2JarX/x++sFVCQs2dx4w7E/tCFjU0EiN1Dt8VcwE6VJmxK4JYFnVXYaw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WkRXA/Qd; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WkRXA/Qd"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47495477241so17270205e9.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761311552; x=1761916352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qvr6GH29Nfx+EsRdL+4o2+h1AfNCPToJ8oczIokC+Sw=;
        b=WkRXA/QdNtxtJrCFjqQzLYldSPXwZQjNebyQX91crgckJ5q+eHO1le1WD2RdflCN8W
         S1zdC/jJj0gfU9mmCVhYnBQpJy2rnotU3Pqj9wKcVBW8NoBHEHMk9nl0gB6pzjommuNn
         ADerOYKxjM7xSG/9pkLgnIqLsKclnp2yofV8ikP7DBOFIFCuQT1Nui5OYnHojxiEmWgD
         BCGihQUWpJE5A4OqEDr3f4nsly7lF5AdQ48BGFAR4FMMdQ598Wq7MNIMi3raZ6/TK7S6
         KiIlCLs4ip8eg/ri5BkVSX6gOAcY7TJD5SllQ07gk661yBY3AHujmNR4YplCaE8VCF/Z
         cdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761311552; x=1761916352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvr6GH29Nfx+EsRdL+4o2+h1AfNCPToJ8oczIokC+Sw=;
        b=KsAx75HvBXf3WUTT5fXoAfjosQX3KKMN/WZSlra9gsoPw4Z3Gjkw53gUaBhUSmfj6n
         ZoN0V4PZFcFB+JgCAjpfGEIHQ3fEO08bUGQxYwuvUvPOUDzG89xJcZZJz4JqxGMrrIkh
         sh7F7fxYeDEuQm6lUb8TQtm3qOFCISO3vlgKEeUgxjlpSFfRK1bXNujGcsnUiBNC9+X6
         6Gz7KtSoDbx3wPV+arsuNEJA+Pqrl6M2Zz+vwRWqXCXhG9ioD531cUoWhB1f3Fx73B4o
         lirfNNTCYJaA3/w7NHtPn1IZkPzKLBc/LBZzRhlrDscOd/6I9G8GRUXBDmICNVCoNube
         IHbA==
X-Forwarded-Encrypted: i=1; AJvYcCXrddnkXQ+/cgVKpnf+FFKXDx6fw1RQT7clLbVbc5IGd+f5HrPmcTxiL6cNGqEYMK5QSXGC4viMDb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYlB6yaW6/A/+tJL5N17evW+fs12YN+g5aUokSLbb+5VFhM3Ye
	eU1ggFinNi5J/H7SncpYY7Ch5QSk0qSyiTFTVpDQ8rmvtz7lXCVvsr897sTuTOpf2Tg=
X-Gm-Gg: ASbGnctcJIWKbER1zVzs2dl3MeWTnlIXTeF3Rh1Kvj6sZMqk2OGoWDOQ3Xtv/B6lqHW
	uLFfI+ChPG1/x1fE8PHx9tq8Dp9vasH5riWG4B2N3A1RN+fwoMMKgZbo0/gQ/ohCLwBY567qe/4
	IkG7I7u/GHjAiTWQV8LWEmUCClXGhoDQ+Hvvb+AuEf+w2l+WxXL4ib+USB8jps5P9xAwYSCI6uA
	UQgJ5zD0JDWYXtXDKfirre7liqO/AanicngBbcaItG8pp6Q6KK2W/+uIqR5tLgSH5U74AtcYlOb
	+jpCl7QB1C6PhH2MqASsmFzixq/Wm2JU9ibCNU4SnRGFroz4KbbSqtBPGf8WrcfYKidIU4uOWam
	vsnoinGu1U4EWKp0L5IfZStNhMH8igMUv6o8JE2ivhnu4/O551jhd0HCr4lXzAqvHyAtjQlXX87
	cgXZDSrGM=
X-Google-Smtp-Source: AGHT+IF+1xCry/9A1ZHNOGG2pxcFEoxq6SJgtHoESPq3SvPRxcc9P29yK7lzj+svNHJcxN5sWMsJew==
X-Received: by 2002:a05:600c:4f08:b0:46c:e3df:529e with SMTP id 5b1f17b1804b1-475cb03021dmr50372855e9.19.1761311551830;
        Fri, 24 Oct 2025 06:12:31 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4342368sm156180605e9.9.2025.10.24.06.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 06:12:30 -0700 (PDT)
Date: Fri, 24 Oct 2025 16:12:29 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [PATCH v2] clk: qcom: gcc: Update the SDCC clock to use
 shared_floor_ops
Message-ID: <mz37jryjovtqz2cqeitosbeznjf6px7444jqxmd3ccmwpbdruc@y5ms43b5wm5m>
References: <20251024-sdcc_rcg2_shared_ops-v2-1-8fd5daca9cd2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-sdcc_rcg2_shared_ops-v2-1-8fd5daca9cd2@oss.qualcomm.com>

On 25-10-24 10:48:45, Taniya Das wrote:
> Fix "gcc_sdcc2_apps_clk_src: rcg didn't update its configuration" during
> boot. This happens due to the floor_ops tries to update the rcg
> configuration even if the clock is not enabled.
> The shared_floor_ops ensures that the RCG is safely parked and the new
> parent configuration is cached in the parked_cfg when the clock is off.
> 
> Ensure to use the ops for the other SDCC clock instances as well.
> 
> Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

