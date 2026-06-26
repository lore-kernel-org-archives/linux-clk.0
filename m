Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83203FC5CE
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 16:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491580; cv=none; b=D8XQS4BIyXJ3HixyO7drTrWE/pr/aw4p7Gx8uRefpQ3F7z4FSuHi/pyvgIPNgTXMQZbnVWwNEOdOWb48gjpL9MSvXjiVpckymIooyjLu+dPqJj7ifEQ0QaU/IrBBk2tOWcDa+1QLjA8PV6BEnDQyZrhNQnuJznuLwako0pDiaUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491580; c=relaxed/simple;
	bh=FOtl0C20K6pWYgLqC3NmwFqGG+mcnf74JUxu/N8X4rY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPcd6nTBVgbM+Xl+tnC2cyVSSJ8V778cJucLXvLkA9nE1No2j0hUXcClHT4xWX0B6qTsgqGzsuxL4HxIIdsALWxf0MEwcZ3jlbEhI0Vzli5yA4yDtvB+ZZJLPeMW0TDWNhjwWhmr+kXUjOgqE3OqPeisLOD96caeFFdJwbzkyrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FM4mhbI9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AbzeEDNu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FM4mhbI9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AbzeEDNu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QFihJv1534831
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 16:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FOtl0C20K6pWYgLqC3NmwFqGG+mcnf74JUxu/N8X4rY=; b=FM4mhbI9KylaQZMF
	/H83hA5OenX/FEyy0XVGhZynfc7VYq3huCjVECWKpNvqkjhwS7Cyvp7F36VDfGr5
	7Q5ElohywSAjhY4A0alTkIktVTFx7Yrhqhy0OE4O07gIicSrtc3yQL+tSYef7Rsv
	3mKTmaXQSMZK1X6QtzNXMz1glJeylwHJq7M4sS8YdIYBfPEtyP5nrRT/LUKHcE+3
	3Hf2YUV1+d3bm8FhM7X8GnkNICcMmzBeEL9ZkGH9Ljbke6d5YxHiKwcULLlmrlvs
	xDUthc2NKklmOg2PX3q95Mz/qlGRvY8tTRNb3I8RCiipW0kC1GpZDLphbjF++IMv
	eqcoHQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1p2tsqp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 16:32:57 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-966ca0f25a4so27599241.0
        for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 09:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782491577; x=1783096377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FOtl0C20K6pWYgLqC3NmwFqGG+mcnf74JUxu/N8X4rY=;
        b=AbzeEDNu0Cj2YKDWmalw1AQziwaB5xFtajnbZRBw40uc7uYJxKKViulDW2T2IFJz3H
         ykWq8phgTgxnhnXXcNsEhz6pioiH5KAJDl1inl9RpFQ+Laoi5pvvyDX8X9bs6oeu4C3P
         Dtu3JtFpWA/YJzxyPNc/HuPEOkP7KCkzI89S9cX8vMM/SwKujOyScMGH4245e34ZwEeW
         Va4+iZTWPR+u553ECv2QvIIl5UCVNTUF4q7X2P8TkFIe8evyp5tcbUEGapMAOQX5iOlY
         zeuVniiMjDOUDDDWa3RJHUFHlK10GVXB4z59hZ/4M78+BBy+plD0fJGUzviBqnvDkndL
         wDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782491577; x=1783096377;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOtl0C20K6pWYgLqC3NmwFqGG+mcnf74JUxu/N8X4rY=;
        b=aH0NN4yKZvYhx6Weo66E8G6zEIcq4D6gO7iNB7A+WbETo/dcqp+GkpgkiVIyLcjU63
         Ehp/NndlHXkfqfLdtsj/5SxGamu6cUMeAioaPSdYHKSgvLaum7cTiPBXxABDn/J8IRtx
         hVuOZHOXsEdjZvOWQGUodCwpR99UMzePzLMax4pQW3Yu6mafHQLk3+KvBcEd+xXA53bw
         mwbS/c8kpDLMyCP5FQIjL7YYkYeV6ET6OE/7mxik6oRGR8g0HFgENK5p9dCao6BeWO4S
         96Am4BsNDMd5U2Ai+ZCSEYmZt5p3ELhgDhJthoAZojmXBWef77HmVxV3SMZFXBrWzMp8
         ecRw==
X-Forwarded-Encrypted: i=1; AHgh+RpUNSPzCustY61wh30CxxUaYPNEp64W5lOBizr74SV3SNqDXwXxv3xxcobkv21pWsVjKVD5TIQdx+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAY29zbU89b5Xi1+yiM7eauSTvgNTYAjeJW7tp2a/6wyWrPb1U
	vNLSjBZ/HSOwjoXZ8ohWRixw/LC45eM51z5of/AKHCQYoHhX51xVw28DsczniJWh4Kml2Wd5uxO
	1DE3S0AvpAS6c4KD91oQP+F5j5HQJiF0da33Bqu6QrjGsxwXX3YptkoBSMaoh/t4=
X-Gm-Gg: AfdE7ckQVnQm08PMSXxPg9F2ubGx4Xz4+mYC63nn9r12Muvq2qdBGF4iTjrA5GhAO4c
	NnisQA5azVvY6J+AcN+UILmPgUkzTuaMGrClmQFm5Y0EAXAvpX35j45WOpN77ORxdn9PPWRU7V6
	tHT9qe/SOW4ISl88ILJRD+HLwBpATeU2Fp8prz6c8D4RTUqUoOfZPGDCIy0q0/+8NqS3N5DOKYP
	MT/BmR3d+667FC7Q3oEGM/q7xszJba9dkJbEWRm41t36SNDfAu4Zm73Us+xRijVxZWtVjEhQ7Wp
	5bgCYymN//CjI0AVlAldgDZM1f5JHUoC+lU7nx2z0cboeWltmhMGATEIXiF16DHjee7hJK0Djhg
	bJOYrR/hZKN9z62m9IIt1Dl7hiCj5clcuZDw=
X-Received: by 2002:a05:6102:440f:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-73433e3dc72mr1396646137.1.1782491577113;
        Fri, 26 Jun 2026 09:32:57 -0700 (PDT)
X-Received: by 2002:a05:6102:440f:b0:6d1:8f7:18a5 with SMTP id ada2fe7eead31-73433e3dc72mr1396642137.1.1782491576706;
        Fri, 26 Jun 2026 09:32:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f4bd44d0sm3050633a12.29.2026.06.26.09.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 09:32:55 -0700 (PDT)
Message-ID: <bcf9fd99-454f-4ac2-8357-b0775be42d41@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 18:32:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
To: Brian Masney <bmasney@redhat.com>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEzNyBTYWx0ZWRfX4npL7PbDwHNs
 KL5IhEv/ELoaGMGwIYAGLhK0G7Wp+dr/wpbxpcRks0dhWbMZN3O7VlZ8HoXmEGsmlGHEy+ytAxx
 Q9aeKO55UoF1sc78s+hw/315DHj282U=
X-Proofpoint-GUID: kzE74aeZrWSB56mlCewXLovhXoNxrRNj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEzNyBTYWx0ZWRfX8CyxvlBCSgD1
 6Nyi/YpjeU/h8hHU2MupMdqoU797BqyzWh0k1tuV06kbBrv4b6BgGkDUgs7NonR2rQaLrPFrxY7
 NIXllKvdfBZ99fmY2Gg3Q/XwyyEniixEYXqeAN9WmhrVaUUhonC07R1rVTd+RBFvBtzJXHcs+yj
 vjY66npWvzoBBrZWMiAwWTs+R79lJcumrjBseT/+xF2OrHVqASuaL8CGt+YAXXT/R0zW9jvKuPL
 L7FCYXGlbY46ZGEE1pk9C8OXS53wBkgA8Ib1bo0hylmy86P8mf/50gA5JD3I6LZfFWKNihheA34
 Yjy64xgjfpMhOOvmCEql4g0tqxwjSl/r7/PZMNqbLEKzu3b7XEYUopkVaicpGOx6rW822Zqzs3u
 IwlAD9v/MEF3cZfjlasvFjw+eKIW1L6RjLWTu+8La4XmaVO13sdUX6nymgrOqqmiMnHLs+Icmbm
 BA7TfkPUPuQanrmMCkQ==
X-Proofpoint-ORIG-GUID: kzE74aeZrWSB56mlCewXLovhXoNxrRNj
X-Authority-Analysis: v=2.4 cv=IM8yzAvG c=1 sm=1 tr=0 ts=6a3ea9b9 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VuFW3N86aykZV0Cky-kA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260137

On 6/26/26 6:26 PM, Brian Masney wrote:
> With the introduction of sync_state support in the clk and pmdomain
> subsystems, the following warning happens when the unused clocks are
> shutdown in camcc-sc8280xp:

Stuck at _on_ sounds wrong.. does clk_ignore_unused / removing
the sync state from the clock part only resolve this? There may
be a clock dependency for the TITAN_TOP_GDSC that we're failing to
describe

Konrad
