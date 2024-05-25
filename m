Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CA5128803
	for <linux-clk@vger.kernel.org>; Sat, 25 May 2024 20:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716668206; cv=none; b=JZPSCa4aZg2XJEblKCFnAlNIb8uQZ1RID7yr2Bn8+NwSnfBqTMgDqd12GKDCiccGwGmMJIikHkjUay+oVdN+BX2vFeA2ZwOxG7pTO0P/Rp6z7jvTFshnTbngx4m9jpqZ/CMXz8akcVNULUpZp2b0GaTTH4OkgyRHAGQG2nAh1zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716668206; c=relaxed/simple;
	bh=2HHhiCt8GLLLa8Gr8o58I0NCI8HzVXKCVVmS/vYl6jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKpsTd7Olhg3TUsQQtDKvY2VpPW6VxTWesMwOZzQf5cd565xZ6KRYWgIOxwwnUE5ro7QjxozpPBVZBKgQfYv93xPqpPwuwc2hwMMjWR9eGB9VpxqIXKsLyzEVUwttHHkpLg2wlaO9/E/bV48oS1IzlAKzqRCHRoSJ8yRj5DqcQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iyLuhf1Z; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iyLuhf1Z"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e72b8931caso80157711fa.0
        for <linux-clk@vger.kernel.org>; Sat, 25 May 2024 13:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716668203; x=1717273003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vxSNjzTuJf4atAWp41vejpcFG0wlQeaP+5dXZqy6R+0=;
        b=iyLuhf1Z6c2i08uFYfcGoxKDkZnElnVmtX6Rlcg25Odhw5mC7SvLZXvYIWD3Q/HWCq
         Z5iL441LviOVASqAqYTNIA5f2Zen+XTE4pwB7GR9sdHLWdvbuPuM807+faNepgZHD0JA
         CAtomdSqfQei0PLkV1gc9WUott/skesHrSYhOypIodDjCPA2dZ9DlK/Jfpsj2plXcVdR
         x1EEJi67HkzpAfRFG0DyqPvoNsN4KSAljdMB25VdSPhApwpiZJkPP/Uo9d+xF1q/v68D
         U8sTlGuoOvGDyCnElWLPDeUM+BbUQzdt8+TATlh/CgW2kZ6oVepn2H0/49SYyTDIPNjJ
         B+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716668203; x=1717273003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxSNjzTuJf4atAWp41vejpcFG0wlQeaP+5dXZqy6R+0=;
        b=RgeiJ1eVXAdgcqhijlBRmpi826MTmxfCtI0zZPggec6WkfzeWuKQdO5P6WOd3kbXf2
         anV8eb427Lro5VV3d8JMLInBfyg7EpanqOwOe7BMbakkDJImqDprDqzQtSdHlOINM8T+
         8lNqzSDScgt6vgFCXtU6lOGYCxuzULWm+EnMZcrRmthR8o2EOskYfHlRdLCvJwM7YDuS
         KCUa1qUEyxkwsCeM+AKBatoBv33mwFD3zubjPADTjMXHWR1k7QbCdD4U17NT7Gqr28aY
         Ppcg5qt5/os2xt8yQg2y8IgyGZ7eXMPVDiBk9N+AYTlp5zgsEjKGuKbkVpGt/L5GXIEy
         9x/g==
X-Forwarded-Encrypted: i=1; AJvYcCVxOcElXV7m38LlYIf244JIjHc4S4E5sC4pRwTqaqIEsmZ+IlVQLB3x8w2iwDeACKJtjoNgC4Z9TqmIp5wYiUx4UTTpboTmY7vu
X-Gm-Message-State: AOJu0YwzERtXaD3Mi+mPiTuvhoeo15IyqdLW2UmnJLcpgntZnECkgFzM
	wgjZywcIU2Iv6QSkrFmwl7R+ZiwkQGbjALL9t2W7CRUmaqxmapSR2mWaIwgcurU=
X-Google-Smtp-Source: AGHT+IGqRSHwvMo1bs7rJRPMNeOrxq/sWSDnSnLjjibtRkPVSgOa8OApgnvVYNKAuqZszWWcJU2yVQ==
X-Received: by 2002:a2e:3e0e:0:b0:2df:b63:a8 with SMTP id 38308e7fff4ca-2e95b278708mr30593201fa.50.1716668203490;
        Sat, 25 May 2024 13:16:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bdd1517sm8813861fa.82.2024.05.25.13.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 13:16:43 -0700 (PDT)
Date: Sat, 25 May 2024 23:16:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 09/10] arm64: dts: qcom: sc8180x-primus: Enable the two
 MP USB ports
Message-ID: <yqpnfhh5cdi3uxzg5ii5677lsjrt7nothm2neysf32mjce22fk@erbpp5lhmqrq>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
 <20240525-sc8180x-usb-mp-v1-9-60a904392438@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240525-sc8180x-usb-mp-v1-9-60a904392438@quicinc.com>

On Sat, May 25, 2024 at 11:04:02AM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The SC8180X Primus comes with an AUX card with two USB ports, fed by the
> two multiport ports.
> 
> Enable the involved nodes and define two always-on regulators to enable
> VBUS for these ports.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x-primus.dts | 60 +++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
