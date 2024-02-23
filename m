Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66647149396
	for <linux-clk@vger.kernel.org>; Fri, 23 Feb 2024 21:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708723496; cv=none; b=GL2fG65OqW0llV6VR8RAifhwvQlEk+wIcI9z5akc7/J0bV+7NVlxwKTAhbGM2IDgZB9hCEOmmWVI/U9Zm3d5t/CBan0KCN++5ZbUQADjan7ENYIHppcdYZSqtoZWHuBVMIs2cAgrWF5jWMjF6nK9KrM8xB1Rh/8+gYIO7K17WMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708723496; c=relaxed/simple;
	bh=FvyHoKuJyRa2YSuYvwYb58L/t6J6cqmjt53b8ta4lpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7V3S9p3pDtXevKnRoZu9hJXgDvskwhuFPhE6y58CpYd78aaHPHNoxVO6T+PZD17jNikEchpmFenvPR3eN05wjxzRecZI1EkDkm4ZaAqrbIXp4FcXwOJBgrM6BP4rDypBSQcbgsU508hkLoBHNvXFbwIdWIQ7KR1JM/eBOncgHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vct6CQRT; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vct6CQRT"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-608ccac1899so5311217b3.1
        for <linux-clk@vger.kernel.org>; Fri, 23 Feb 2024 13:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708723493; x=1709328293; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wgdv/OJ7jeihH3J71yo7/tj9HKsPe0FnbUozf7yDTNQ=;
        b=Vct6CQRTBzWbruPsv5t+6DPHxnvlQZ8kApu6H0jleKJOC6lNp3ZwC8N0L57nqWIWUb
         JVveM4muy5iQLwSjqxKMNTYbF8imUTBAgtvYFis8BrPcjD/Cr7F19HjcWVPtkTO0MdUM
         0R7lmYvZiyN7d8P3zB6BcRmS+QD1UC8kkOxLb9vL3OPFkwMEoTRGUIDF/yfPzj9OqGT8
         hNQdXAxg8Qjj6Csd9CvwTp8+Fd6DqsjfFKV1pdSn1w0N3S0ytb2Q9RCswO+gnfuNdf1a
         OvsccS55TvJ62OaKlSJJEIsGxeH5gyW405XtEwmGKhYGw/VrNY6MBb7LaaJABzfa0maP
         W4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708723493; x=1709328293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wgdv/OJ7jeihH3J71yo7/tj9HKsPe0FnbUozf7yDTNQ=;
        b=LEg9EXZxjWjPwPFlCLZeiH9TbLNxIdpDuRmc/xqQU53gfa3O8StIXbvtQPo97K0Ohp
         4KRnSwMv+oDwtN0E4ZXVLlC/CUZfkmhdYHQmU2ks8dL+e0LtTKZAAoumYFNwr8Ed3H83
         scFyl1M994uH/C5HuJvNk3VA8Fq6Bd0dfcgl97sZTH2mWjS0qwFbRmMsMt8q+N9LkD/c
         ta7YosjKK+VgEONMjRbKMH/IQFYPIfZOoGvRX4ur8Z7tAmwxIljMn9MNV8PL0cxe2ZhE
         jB54LYXJqI0IoBlc8S6fvAqycNF1VH8w+fmgj2ujWw/vto8suI61QmLOVduqFzdCO/EK
         zMsg==
X-Forwarded-Encrypted: i=1; AJvYcCWJYSbzCwhQqTSNqKp3ljr91UoVzhwwzwAuu8ipfVAMAwfbV//CKpN/W1XWs98fEZmr10CL80FDHKOpYnkpIjZJzHdWiXi4uWsU
X-Gm-Message-State: AOJu0YxqP/usGbA3fCrRPZmeMoEH3wqLwQaxP3cwqHdmXXSYowvFkIy3
	70RKPEshgBNV71BVOe9TpqsYmRkNXnw57XeUDzPOlLu6hhKB6ohGsQiwJr0a/JvZdu6hwjx7fyP
	duGBXu7mILBTbndXVefGlNXvboESdEDZw1NxTzg==
X-Google-Smtp-Source: AGHT+IFMmUBgDbCE2Q2G9lsAmZpvVhtEQwvP+lU1HPMuQilfEiaGC1y+Wv7lhCQH4132jTFroLi4zQTtEiwxKXXZKTw=
X-Received: by 2002:a25:3082:0:b0:dc6:c2b2:c039 with SMTP id
 w124-20020a253082000000b00dc6c2b2c039mr998519ybw.41.1708723493452; Fri, 23
 Feb 2024 13:24:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org> <20240219-topic-rb1_gpu-v2-4-2d3d6a0db040@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v2-4-2d3d6a0db040@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 23 Feb 2024 23:24:42 +0200
Message-ID: <CAA8EJpqnAoCDer93V34BaFHf5mhiNOFMQTP1Xaeoio0BWaPzhA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] drm/msm/adreno: Add missing defines for A702
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Feb 2024 at 23:21, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Add some defines required for A702. Can be substituted with a header
> sync after merging mesa!27665 [1].
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27665
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx.xml.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
