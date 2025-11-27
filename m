Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2305730499A
	for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 19:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764271731; cv=none; b=axl1DVXMQR0Jsmhpfvx1pjJjQsrhNGWdw7bu6SY384H1NbDwL0SvGUmtf9OdZPIYa2pL+/L9RnT9pjNa3pb5hnGixfncjIRPuqVCQfeB0PXHKbRXN7PjJwBX65rtSAKg/dJo3Fx8dBKRD3H6fwSrMZoXFRQ/BZraHxdXudV4hDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764271731; c=relaxed/simple;
	bh=HgNIphkgRWgB8H0fofmVUpH+pm7TGTwMqkA9pghB24A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XMQ9Ut85C3aEvid9OckSWap/0+T/XMWP6qLuYMQXixA5cFxY2BKKcsvTU/gSrGPaKYzgcx6UalGXmkafR+V4B8KM1Tanydu22Qq8aEukLBsDw/VFsKGDNVDNRViLIuO/nnvHcwu8iF3L7CBHglcMg72LxU2tCEgbWBj4rNKW04c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QFsktIJS; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QFsktIJS"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37b9552618aso813921fa.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Nov 2025 11:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764271726; x=1764876526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUEPJnkiBuZQK3LUealV73M/xL8bSVg1Its+Oao/Qno=;
        b=QFsktIJSRX3pmGsJf/NFZrSnJyLDWDIZhqSuqY9k4zIp4egR7Y2bB8jAKiglC1K0U+
         qpgpJKfPMvEOK967H1qB3KU3pe+Hf+ovgRCjhY4zYmBgVnkupA5X07+XKYsFN2m4gSv1
         SNOXsrfHl+ZJICpeqkUxHrAXn0NLJXYhzK/imi/+XuEmHNqvUDZQbpXDiICQxeryy6H6
         C5y+GJ9KoYE2BlSxYvRMCipG51GDgn3ZXipdX1ogMBLZidPs+y0eyGKDem/aakFU3ROz
         iPZBuDyfQdpmm5d/IqBN+jWNMaB3rjqskgAQ7+1t8vMf5tEBFDEk5bn/eQa5sF3sl5vy
         UMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764271726; x=1764876526;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wUEPJnkiBuZQK3LUealV73M/xL8bSVg1Its+Oao/Qno=;
        b=vlQ8nu0VFoiYg1RfNXjs85bnGhaSvVPPgBBRSbCWiVx6wavNFrwMI3qpD4mjStWhlK
         EY0SAgtVBesn6tcCi0EflQ2COaYrSbJfS9H7Y0mJvr6PUKFKAblpTdoRpHvekqAiVXjJ
         emfpcXJ6QUic0RnXlmP1Eg3fAWB9PwQm9sLDTOTzhghgOU1bbZ9EAT3SI38k8zRaheqP
         n95CBbbTkbAQl18OjKeYtML+wEZzTn+roFID+ObeVGApOrLYTZhMwtCof0RLdtXD6fCO
         tK7XJcgWZ+I5AfNekNiSrccdwYX0PgBoR2kf2biYEW3JnpfqkDrKhjhssUtMMCFJGO5S
         SKTw==
X-Forwarded-Encrypted: i=1; AJvYcCVdTh2YtsMdWfnR/e8D9NUDQJcxRgPM77y2+tFHRolQ/zIzzzf1+ihIAelzuvVS6KvphOq0Aj0h6bQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfXGqw0GzClDTRn1IseZZHMeqnglBtSNu7lvgrVq5TWhnh8Q7h
	+vjxRnhusQHbMCROA5gnK+Qg/snxWze9JoGwHzEh/ppjBmFWzypub7HfILzAPXFXasc=
X-Gm-Gg: ASbGncvJeOPRytovN1ZotdXWs66bpEPBDkJEw/9NWUgVF61qL7Maqm0uJOQgAXd+4rF
	+juUieP1GkJU0SG4l4hs751ZuMeNkWY0kZTs+09OWzk5pXo58WFiY7EN+Du7wJcN9DUjl+bK4g8
	12zqw0VaYLvXt+PVprXr+i3uI70OPiAOzkTKlM5m7vV+u8oByqNS4kqdYfiqMMAGoxuFHNLVjzL
	0aeCv9vGNd8pGWmYj2ha+F8SMb7EN74Vac6Fn4Y1kubeM7wn7upG5Js9UbfaXcP9tfLNqsV6Tbg
	e1ETmelSuTaSOwMTv21KoNhl8ESlRA+BXe8DhZEsY3c+on0FqAWJFAYpRhv17JLBeTkj/BkQADC
	rOQ19mOSwxszp0C/+3IStitriwgHGgvKbx49ASfuApxkQ5wcveAZs8qnLr6d8h93b4H++4krKgZ
	NPGbxn9SuWa6+hdW2e2IPFmdjKZb0dW7Nmdv3ofuHze0dBtTDsgNH1T9gUBSXG7CXQ9A==
X-Google-Smtp-Source: AGHT+IE5LGOdLf0Y/iYWvojWMY550Bwmp3eJqTkKNZMLAkujkeD1aIWJHItk+jaTtGViyh0dgvqt7g==
X-Received: by 2002:a05:651c:2583:b0:37a:407d:6359 with SMTP id 38308e7fff4ca-37cdc33f096mr34504321fa.1.1764271726185;
        Thu, 27 Nov 2025 11:28:46 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37d236b7e97sm5545551fa.13.2025.11.27.11.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 11:28:45 -0800 (PST)
Message-ID: <132e5d5b-fc90-441a-beef-2774fb7d56ab@linaro.org>
Date: Thu, 27 Nov 2025 21:28:44 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] clk: qcom: gcc-glymur: Update the SDCC RCGs to use
 shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>, Melody Olvera
 <quic_molvera@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Luca Weiss <luca.weiss@fairphone.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251127-sdcc_shared_floor_ops-v2-0-473afc86589c@oss.qualcomm.com>
 <20251127-sdcc_shared_floor_ops-v2-8-473afc86589c@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251127-sdcc_shared_floor_ops-v2-8-473afc86589c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/25 19:57, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
