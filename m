Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEF93148D2
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 17:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482853; cv=none; b=sNS9cUvFZyYS4+wpW+QYtsZaeYUBzNZhQiPgOzRe3Rvv9qRwPE1+vv+MrX7/BTtpOg/IN4HWiFvPeyzKqZzgy2D9dXe5jyqZu9sMMpAvIW/lnjV8FQgi4ili+vlUuG4FcJT2/aOI9ATv3bsSkvOOLtL4rbGpyvvpcI5YpiIsf2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482853; c=relaxed/simple;
	bh=yCWIwBdLFpCGU43FLzu2Y1bJJRrVmCa3tAElrOPlN9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ccwhufNauiD8q+Ly3n/OJ21GkRVBvXRujKhQzSECTL36KLX8DJ05k99xjByKxKG5g9mKV41Y5PnELTI/gwRHREeZchtLHq58PThIrp/dPAlOprw3+gEQ9PhpMBT1lSa38tj6xTg0w7jjHNqssQvRXXIyraqv6jc6dBQqy4LackE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gHIwhoSJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZjQ5AjlX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gHIwhoSJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZjQ5AjlX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TEQatn1795831
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 17:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ox1tQ2IT52zVdwvRySjuAQATlpXh5Pf7h0A3Kb8d/tA=; b=gHIwhoSJZsIMDySl
	8u80TqiFp+8DMaSzZLEQpbpvOw6ANA08F+yXoPMU2+OQYbiZLEVT5iTIa31KmOlA
	1QdwuWMZkcqa11TgK4pJi2TXfSDuYjWCg8YOeQh86t80NpQ8y7jQjX7eNJ0CuBWs
	3OVbsNjDgpxgaDe3dCccfqnUVsOzzvYlBy+4A2in0l4oJCgfQaOG6yxV9WLDM5ka
	NLgGoyz4KyVQXXbha/v5leIn58Wp6315yQiYN36e66/7Hh+KQsWGDOJkU8qblHrT
	ODJ/WBO/YLagiww6JYIL5KgXt4R1DCTcSACDYWRMSwfnP5lkwJH2+0rgYDx4veCS
	UXg2bg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dukrp0q4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 17:14:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so803119b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 10:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777482851; x=1778087651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ox1tQ2IT52zVdwvRySjuAQATlpXh5Pf7h0A3Kb8d/tA=;
        b=ZjQ5AjlXny6k5gLHmpCYMXAy1XFQvaFPPjpj4eXN8YEIAVFPF+zftG9kzqmV+og4Ux
         ktb+pA52KrXfYteF+sufzswAXCaz/ZzJzqErQGS3qZaY/VB646y6Miob7bgQUBjCfGsV
         JIa6wTz7J7L6+3FCD/vVKBTYPm0yyKJS8flrBEUPf9X0TFhpbxW0ECfH/GlbRd6sY/4J
         isO4dLyFuXE7TRGEmIzIZSvelzyZDJ9xQoZLBMPMUfkk1q1dr+mi0vFU4hwKY0XEV58N
         xCRJH74mbuRe6GAu190b/T/TytqZYOCIpqCwM6wVg/THdXer3WVp1pPUAd9jWs8BLKWP
         Z6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482851; x=1778087651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ox1tQ2IT52zVdwvRySjuAQATlpXh5Pf7h0A3Kb8d/tA=;
        b=pUKuaUF24LR6IrrI9V3Afl8H8l8Chqv/GhICIGScAxGdLUqwdY3NKmHBAfK/sMe2wj
         3XgiJXPWgKD/tBWz5MyUnYV1wqYZYQFOpG/Vw3eFxfpr6uaHcUnLaDY5xMJ+ob2A7OmE
         nrfFp7lAaRlTdNO8jPSONo0UqiybL+5wT4yJDzLsCMX6LoT1+5C0qBG0QXKVH1oWxp3F
         e7FP+iW/H+7C3HeGWZVNNUhcbjBbo5EO2ytF9KfTxK2Orvgp+DLsC1eZ3wwn34omsWIr
         82qkld58Sai+I0SB2JPw8vaztoRMyqRxnMimmn92v84fR41Li9X/E9fvphd4vEclqJ/X
         qGmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9j1E7YjXiH/ATWSAXNCh75lgAB1G9VxxCi+nZe9fNx3XxSAYBkWCKfT/D7lNYdgU8N8WA+nd72z4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe5CKOdjgSCSPGEEe+0v78u/6el98BynX6OJ3DsoiRaPJSvwXG
	FFZUiyjoOD7dEgmpHnq03/SQ7c4VpqDiq+W8uciRw/g+f5bWY08TMvH/UWPOIWsEPkwR8bP6x77
	IQLdytnpgRQSaGVgWpe3iWEumcgUx/SydNWPKAiAc+9Uk/PNnj/VmOBkF13L5Vr4=
X-Gm-Gg: AeBDieumkaNkZAhCKmuh3jxxTeSiIjLjI+ujPq4oGAItDku8FEDRK8sq/C3PqKKUVJ5
	asv+hDI4uJSYL3t4E/0H5kpUOiJx6ZK9N+IlryaT76F7XMaFumpEUPQZLXf8WcdyoSolPwV/+Qo
	1dANGVDL0eaVZypMsn9FlZEdNjLIDY15jGaEtd/Zp4HBbu6HtZ1QfYGdEAsFwwM1b+1yfBenGzZ
	vKzpLNOyu0KULmXkoVB06NPsEdaNuSKZx8MitR6STItnJmYQMKPDb2wz1YIQT1yq3KIdIohP5n4
	jVfwpdYfu28rwyJyNqamAFYbMTQnzLU1QdXZpqV53pwQLeHVzA9aY2ykkkbq/Mfe9e1uFpGzdTS
	irVPYFfbZ2ySJkZz97RrUtI+BVVunEWDsAOGCptZdeVvVEnh3Oo6RRoh/EFY=
X-Received: by 2002:a05:6a00:181b:b0:82f:7cb7:63c7 with SMTP id d2e1a72fcca58-834eb435577mr3395671b3a.11.1777482850665;
        Wed, 29 Apr 2026 10:14:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:181b:b0:82f:7cb7:63c7 with SMTP id d2e1a72fcca58-834eb435577mr3395651b3a.11.1777482850187;
        Wed, 29 Apr 2026 10:14:10 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.27.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed2fd07csm2709847b3a.0.2026.04.29.10.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 10:14:09 -0700 (PDT)
Message-ID: <295c6ec6-742c-4f34-81c7-5fa8865c0d5a@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 22:44:04 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: Constify qcom_cc_driver_data and list of
 critical CBCR registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260429170859.247165-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260429170859.247165-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U8AS_vKxV4wUexIZINs0wESgqfOSHNNo
X-Proofpoint-GUID: U8AS_vKxV4wUexIZINs0wESgqfOSHNNo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3MyBTYWx0ZWRfX3jP8HzsWlmgJ
 t83+CHrPAy4cxTgQvOzb3Gi8sCWrtgq5k59i70/bMaxZXbBi9PBGFqB8oR0XryCE7vJ6RqhXw20
 sQX/l2AjiMGvBszm+ZuB9jts44aaiDrJsH02pbo/jIlj1MMhtFGIysv88KpVZbySS4FcECHN5VC
 EIcfzPjxsXZbj1DXTpLb2aP8jrSUjP+d9OJk+lgT0ZYayeXihIjXSLHPFjl2fHfmUrtiuG2MwnF
 EHOCaAmksTUfXYRQuSDq6JGiRjUh9U3rtgW5yUrpxebpNiJH0rAbxeL7Cjg9S6JzZYz5mOGzwqn
 QKcLzuEMG8/cEjJ3/beWv7Bdzbj7DnzsKOIi8E1NUUkRUWiPP9US2p5Rw/KSz/R206Ec6aS0HzF
 75y0AEmzKPxK5LD+OQ8mdjus1yTwMBouo7aBHhvdg+TXzuXNQfwVJVA+4MphWyyMJUNXvvWEBZ/
 tQav8CbQoC0lYlhNddw==
X-Authority-Analysis: v=2.4 cv=WoQb99fv c=1 sm=1 tr=0 ts=69f23c63 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=feNXzLEk/NYwcOu2G87RIg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-x_MtF83Af9THDvFyf0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290173



On 4/29/2026 10:39 PM, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
> are already treated by common.c code as pointers to const, so constify
> few remaining pieces.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Constify also nw_gcc_nord_critical_cbcrs (Sashiko)
> 2. Add rb tag
> ---
>  drivers/clk/qcom/gcc-nord.c     | 2 +-
>  drivers/clk/qcom/gpucc-sm8750.c | 4 ++--
>  drivers/clk/qcom/negcc-nord.c   | 2 +-
>  drivers/clk/qcom/nwgcc-nord.c   | 4 ++--
>  drivers/clk/qcom/segcc-nord.c   | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

