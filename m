Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AB3354AF5
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333227; cv=none; b=h55Fcj9KtFu/hNyfByzGoVOsPupZ+fLuOAJCZjc/z7nPaB7WiJNnNwoOmfZOHXjadx4qdcfXNLO1DSo4zlH9ZQp8uIJdU/Uc2yFksSTFNuVXVqqEu25d2+K+6yXYuUu0ZRlsNozKQE3NK7W3liMSwNryAXgZlAeWIawEWd5sMRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333227; c=relaxed/simple;
	bh=38zneP+037Vy7Mbk+7KlLjFuG+3hjob8r72QOd9MDa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pww32W6+Z2kQcQSA6wqfFAmKl+3zxX6suBucwOtE3nKJpnLqtn3Ehwb4Gn3bukwgWMSij7S/74GuQyrisO8i4xzf4goB7yelOjmg4AWEDgV2Y9K87NZSu1bDEowTjCNNhxghzlsBhI637K0GxQRc3dA6KL5KG9fSXn3FYJoW4qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DTzlayDl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9uJw0g9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DTzlayDl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9uJw0g9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBvGSD1067216
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n30d7bzwJAIRQwkxdoxxpoTkiSLbasbG65uhCKcM8aM=; b=DTzlayDlGdYju8fa
	yAFmDByAinRgzVfM6SWSMPjFxaivGX6MaC62mi/4vJNmg9s6XeqTrmXRUUbv7mtr
	9dB3bd0Octj5btmEE/Ad8cpF1BRoB1IPLak7Xop6n14+mguArVSQdTPOMC+mqNBo
	eQYg7tRT3tUredzttD2SZQ3wViNImzbS2o6Xzwb78imntNPA+AgfzcWdELY0rZn0
	57Zm2zmby4uBtrtWNcdTI+E64fjXD/ibKGwZ369VOgipC3uNsm1GET1CZaZx+3NE
	yFQQT6tiOW0nFY1+C3XJhHjfTzNqgrRUKIFvzyj5eTUdbVFDAISE0doaGJGQ8VyP
	VXhxgQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d82efr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 13:00:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954937be97so34896326d6.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 05:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333224; x=1771938024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n30d7bzwJAIRQwkxdoxxpoTkiSLbasbG65uhCKcM8aM=;
        b=N9uJw0g9CoCHNeZTIOXZio5zIPgU4II2BE2quZY3UXh4sIiHFw4h7bvTmzWF26qgUr
         CLhQAGLFHIhywZYORfC7BoPZMxZ3cWHl5ESfNFiaPq4l8mX8R+Kz6D9YZ9UcxjuKU5Nj
         nh20bjre//W8Z0zNL2b60A6IuPdTVvGUspYcdqfp0CX1bSj8PlyW2PZmnyeeiRitZm4/
         TbR/IyjXf48c7lMO0gl2kXfoWMFeU9blptcoEh77Nylw1w6ffcNApbZ2wrYrWRlg7eO7
         gG5/uqm+Yuc2/HIt/8JW43mkfWUTmnAt1JsznmX/DdGhAcl018rfizcR94dsvWu+q5lP
         uC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333224; x=1771938024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n30d7bzwJAIRQwkxdoxxpoTkiSLbasbG65uhCKcM8aM=;
        b=CLpCp0OFxEDdrvqTTwby/xn/ZQjZOJJiyH7ejBRZjoT2Y+y3E2/bBj3UIAG8FJjiwx
         8qcTKxbHEi5Cg/wOPDzQueh589m0e6VqpNfE36WwqJnE7W/NMZrxs50jYLP1XaCNp4Ax
         JHrB0O/wtffD185JlBy+60lto/3SaJ3XrirqffeZJk0uZFHDLoaembCwNbjwFEXop+Eu
         lE5cMcu+sYnLbhfrTWf+BlZi1n3n06mA1d0tvJB59G4viiZdO8CLZFXpSiBcj1gP8ZiQ
         tudXUF4dZnKVBqZBYoo/pY+HaXPZ/iHImj9Au3gUvSgzRwbJfFIrSs3qIvli5wpQHCV9
         6TfA==
X-Forwarded-Encrypted: i=1; AJvYcCVdtScGrMpeLzaZB1sKavrt8B14mZ8oy75Ubr+LwbwV8rZLn72R2J5BfsItOVuxxaFJKb9oKYMUKec=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgb2G+gV/bpBXOnjQ/DRQfxZ3f5Yb5HTECDUkKzWQ16LqOlL8C
	99xk5JnqPD1lcmKNkBZYgUa9uh0qQRBmO1OMZZ5jPN8iEHhvaVP4Hdu6tQd1WPPsGfFb4a6918g
	cDcXA1wd1YYqDwnYDNnetnSfh/Ox7tNfNFyMnZqx8QQUMKC/Ee4tGtKvfcvQi8Qw=
X-Gm-Gg: AZuq6aIOkiT2hf6iaWSNo5VaBtTdOj3R5u8aRnLsSOYRub3PTTvEEfXhJp1rmXsggL4
	i45gwjEC8cXNOhGJZJNvWsQ99UH5HfVKthaZtQO6Udyx9tPGCmUYOmxBHqKTKi396vplkC7rhrn
	9SwIpB5rXGaynXytG2nMBDZAjOWYSrMMFUsvj2xseTMQftmnq7ITYxdq4xnLfr0Vm2WuUhYymhF
	8Xg6l61Cyt7g4ok2MmgX6GCW6YYzySi+PqI1JqRxquhKbeQ3pTpJZ3sY5K0NjiqmwqcHK6M3BLR
	LI7xsFLpWCHUDf+MqAC5Qqik3DxpE7PvYDPDibz/kOHdCP4QfzrkryCQE6JPg12Rjh/sP3a2mZq
	2x/HXoHOYiUf6S4+iCVhi1K8WBBGnYei3HyvRObFbc/VanwqBWb1hvDvaj/qW6nyV9eTy1RSIbM
	FNxQs=
X-Received: by 2002:a0c:e002:0:b0:895:3b2c:7708 with SMTP id 6a1803df08f44-897346241b8mr142991896d6.0.1771333224375;
        Tue, 17 Feb 2026 05:00:24 -0800 (PST)
X-Received: by 2002:a0c:e002:0:b0:895:3b2c:7708 with SMTP id 6a1803df08f44-897346241b8mr142991386d6.0.1771333223961;
        Tue, 17 Feb 2026 05:00:23 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f7b8asm346310366b.27.2026.02.17.05.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 05:00:23 -0800 (PST)
Message-ID: <fd9a728e-51d7-4c8f-a54a-a45b2ef0038d@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 14:00:21 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: De-acronymize Glymur SoC name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260217125819.281209-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217125819.281209-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=69946669 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Rh8BIR2qzSpX2dRZ-WwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfXxittYNTLSqBK
 4itdcTl5k16imhvd0YiiY7rbCHnGZFU9SFkW+k/5QOcEJkrIPDB0I8FRaNx3sKf4w2EZgSjZpv9
 vZ+3Qyddk2p/anATWtJy6+ZKML5oqwbUfSPtgvo42yIuF6n0jVsNS2pE1Kmvn0AdWJdcOxRe2ok
 W+Q4sYa1fSrzyw7v0Mtn2hlCkYng4AfZlrNMcd8PtJbwEzl5hjgZllydgx3ypL5UHkUmWnW4o2n
 b7hs3eWoQfZqAs+Ldqb+H3AhPgCrvV5qxzH6wfTmb/wD+MIeFxUXQMERjmlhUFl/MCf7mEvkJt0
 oQgTuRjJNYOjfvoPYbtNcgpOh7FC/sbxbAyyYzUxRCyg0ANJhPE6gV6+n6Eq8W3nYXRd9GDkMOL
 2Regn0kR7suLPYj3gsBKHKR17lA1JiQSJa1BB47xYc1ZP+KWc/+Jz+1acjmiMGgvbDYUXGCE7eq
 s2YRgbpu0YnkrBhg8Mw==
X-Proofpoint-GUID: Vv6EGxnRPO50qG5-xIM_RAPg6ety6jpw
X-Proofpoint-ORIG-GUID: Vv6EGxnRPO50qG5-xIM_RAPg6ety6jpw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170106

On 2/17/26 1:58 PM, Krzysztof Kozlowski wrote:
> Glymur is a codename of Qualcomm SoC, not an acronym.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
