Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC9D20C48A
	for <linux-clk@vger.kernel.org>; Wed, 20 Aug 2025 08:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755679190; cv=none; b=Tr4Ujsw5Wk+It8+aO0WtJ53v8b8In/Dcdzb5PWjhfQ/2UzHPfSbpyj8bLhPZyRSgU0J3LDwhjoFD3GOJKimM113iB/hqaNRlCtmIczxTiynzLBzlUOoMaED3Aw6TRC2RNsDYDI94JNAr0h3HcVpAH74uDhBTCvflxRXI0oibExw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755679190; c=relaxed/simple;
	bh=B5Odn0BpuqAx/zQPP5UfzrjrGTX8wxfSsyNahtVboZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmmv9CKCkWL5+r+6Td7c7GqeNgz/ICXGL9X68P1HucAugWZor3UFiMmt9iGry5ojlF/N77GOLAvpuugw++D/wyiigmzJcRRey4q6YeAxm2z+rg4P/CYceGAw7XoqEkkJZWjYZTtx9hlJqj4pzsTzzLdIDLZ6FgDVZNQA15yOxuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ofYFmVYq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ofYFmVYq"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so33513335e9.2
        for <linux-clk@vger.kernel.org>; Wed, 20 Aug 2025 01:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755679187; x=1756283987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IfdcMs0PNyVozDxCFB7NWyoBaP2B6WgwAVLq6ldhhGE=;
        b=ofYFmVYqIz7TnLyqS3oui/I6FgAZ3uQL8D60Gd5HHy8UsCMuC6fgQZKfdFGQipUPDL
         RJ/L3lTuYfFEJ3oNwyW4bDZvzuuB/CJ2DsXizq8qb+V/UdNbBKrMzGF2CkvCN3am2NlZ
         riHGA+mO2rGW/ZXpZC3Yrt7SaPQAZo+EKu0n74OTJkcdxDHSpOM9p60b+9q6lQnbwm1M
         7Aj2mlJt69N9sdDqQRkKRoUgpIRkTWkDX3iqoZ6N/luck3SbwQ+O6DeuB6ll5hdBYpi9
         qNKNRkqDty5aQHU82EtlJcJN5w+0RsZKOdBID7Ha/b1dBzomum4e+Y9tmR8SHGlNkpV7
         6TTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755679187; x=1756283987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfdcMs0PNyVozDxCFB7NWyoBaP2B6WgwAVLq6ldhhGE=;
        b=b6IKKc+gcXZzrwvo7EJbY7GfnA5e8E5xX314B4R8HdmO58Q9xqYUobfF/IhQ4RW7n/
         gXhWJRdzAPdGreMm2nSnIcudPpvbxVx0UVfAx0GO/Y4e6c6OTm5FaNkBVtRKpqzbGVZT
         Xtc7rXzQDYtbuhYUgfKIVVgG2V1eHwGgDhRTwVSP39t7ajT41o5pavkC0389BEQFTcPb
         baZp8w8zKejTJRwGUsWL5ullBHZsIAJvDMU7cjj923IondseDm1twP0bAauBctpvnrv1
         EkzD21YIcvb1SLD+udcn+INJfRcDqyL/ltSpZyoahLqjWoZ6m/C+q0nbSJltgb0eRNHT
         T14A==
X-Forwarded-Encrypted: i=1; AJvYcCUxGHgU8rqU0ThqU4B0GvArMxPg/tJ86FhjsdrH6rs5cXLqdJHnsOtfeJThLLi4UFOLXThIy90SFTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHvBhABhZ+JC9lawGC2t+a/x9zQ6AZv9ZutgsUFllWttykq0LK
	DsFSxZE2mfoH0bwUBLATMpCRpEdysGI5Mwl0ysylwPe533GDkLF0+46x2oHZrAjkuIA=
X-Gm-Gg: ASbGncvA/zA6cGO5WWYFOOwlbNkRJKD/TF/Uj3+NrNZ01jDdhqG7BFvpe3CbD97KHwm
	1TwTzivMimfe6jvG7pacZ2U5WZt3+ZaL/LBMyLYH9eLmVOfR06405Cw1vbZ1Lqi4AL2JVP93ZJG
	w9LE4627gFMfpMbw46JjgOEm7Yi8oHdtOxfPqZ5DhiwRX8EQ+68rePueNdCuLVvmJVSb3/1Ub94
	XxoSnxM+AGIWwl9qVJQEpYBolG91TydM3dqlgag4RU3Wo6U8YuMm7O15J9FcJoV1end4DFtRwxr
	b1a2lRLX65fQNYdMeeQsCRB1LlMdrQVt4PuSuf89zcu/i9j7n9RkWcjDC+K1XNGrb7rLHzS4NCU
	z0nHQ8OEE1+RuDpsUnUo=
X-Google-Smtp-Source: AGHT+IGJauwKyrl57epN9GYL9wKpPJYYPayxZn61Gui1IwqTxzG6ooIUmqPZFZG1hvz5cY1leyuB5g==
X-Received: by 2002:a5d:5d0e:0:b0:3b9:1684:e07 with SMTP id ffacd0b85a97d-3c3303dbf5dmr1187908f8f.55.1755679187055;
        Wed, 20 Aug 2025 01:39:47 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077789106sm6850315f8f.51.2025.08.20.01.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 01:39:46 -0700 (PDT)
Date: Wed, 20 Aug 2025 11:39:44 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/7] clk: qcom: Add TCSR clock driver for Glymur SoC
Message-ID: <aKWJ0AG4r6owg-O3@linaro.org>
References: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
 <20250813-glymur-clock-controller-v4-v4-3-a408b390b22c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813-glymur-clock-controller-v4-v4-3-a408b390b22c@oss.qualcomm.com>

On 25-08-13 13:25:19, Taniya Das wrote:
> Add a clock driver for the TCSR clock controller found on Glymur SoC,
> which provides refclks for PCIE, USB, and UFS subsystems.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

LGTM now.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
