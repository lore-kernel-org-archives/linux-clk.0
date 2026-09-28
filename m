Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF2546E01D
	for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 08:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583240; cv=none; b=oGb3OTwxFA9ZrM9PwSP3CQDMGd/CEtpqKvHaxYPRQ6p0vghh4oVtc78ySk8rq89amEe/zshqFYtSy2mXwulhrsOzKuX9MakxS4+JYqDIRg1c/yYqFFvLTolPINCH9TRa1G1evWiQh9j2LbBkL5x1zkWd5CB+5XXgjGEHMy91oBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583240; c=relaxed/simple;
	bh=fUtDTQF5AlpGxLechFVY0Zh74+1W8n9TdovwRc6CYOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=elXN7J3v2mt7zMLxv6gnLlQoOkjvSecTJd57ozbWC4jhPopE9iDOoByQjnFyXF/Yex+FtE0aoL6uAe26bH/D2J5M0VGIH3bGvqJLssPOIUllU+acuepeEWFVr945+yhwJ/txedNDPTcWLaq3T+eW2rAkd9WqFAwJo0HFYwtUVVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFmbm4wJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OahM3W4l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFmbm4wJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OahM3W4l"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S80bAh3696869
	for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 08:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bV66Joy9K1eYKpMF8EkPNsN9IvQG+xb/EFdpQl0yQJs=; b=MFmbm4wJMmN0AL5c
	8uAQtdRPzfofdZaSK/kWkW79c5efOjMVP3sGKf6mTYTOs55OzQ+5RrGLNlUF9rv5
	p772rIht92eU9OF05waMVmIoD+GYPTjX34NuKOXlqlczpwB18eh/uktE51QGezm6
	ZW/+WbtEKnnM3+bItOLaYayW/1RA8IEg0xYwzkBcayTxIWUUDm2tRqOtWee9yusF
	4YKs5cP1Vnvi35RA0jeKk/MNI0fLfbldexrjbCcEVKBD/+IX0Ve9ftfHo0LfV7xA
	tUM7wBZH+r976wPvtUVgPulAoxdqhuwsMpxqx8Oh714xHn3Y4CijMxQ4Lw8LcYLZ
	4gNyQQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx77jw2ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 08:13:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86a880e91f0so3985853b3a.2
        for <linux-clk@vger.kernel.org>; Mon, 28 Sep 2026 01:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790583237; x=1791188037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bV66Joy9K1eYKpMF8EkPNsN9IvQG+xb/EFdpQl0yQJs=;
        b=OahM3W4ll9QJm6ZPaBVTXE0y0jr06S6YhKJ6Y8URnPNHqBOg6dMZZPyU32PBWGwbFT
         RFtwpmDVhdgfJGNBNu7GObNgsFTdvgAUzzMuCPjtxhcTLEkOPBq6s+ZoC4xcGIbyAX3h
         TOEYqsUH509/MfAQUK6DNCL6RNDtz4Dln5uqr29arkvLYilJRHoQC1HZn8L0PpcAqq49
         DHzK4GmhMukLiYIXwMIu8/kqWnCURVDP/DuAEMVXWW6x9rFq2ZqPoeAL25vRyM6jV6sA
         ouYQwjqCWIVbiKjZBhDUXcwvkADaf+AZF4+Qqxqk9vjORqwXtaOqXtMM0DDLZ1KA/gon
         gW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790583237; x=1791188037;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bV66Joy9K1eYKpMF8EkPNsN9IvQG+xb/EFdpQl0yQJs=;
        b=I1gMKCAxitwnQBQLur080ja8Lw35JM1wphWbSx+hR9HojLdymKD/9fG6QEESJZjBBU
         sZAYvDYkYy3cFOkzUF2Uxl0hLuhb+x1KeXdR8wSRlUWILFTD1vTkN3hRVvFEJqt+NVt6
         i/k9GkUrQ/o7dB6XljGCJIBVpwmvB8eGvuTnFr1VwvhnrkwdpgKNm9DWPEZ5DAoF5zPx
         IR3BbQK/QvgC7Wem7YiDyvHYxCn4tmAdq3a9axZLzo4mQ9ScweCeAN2WKXm2/svC8TGD
         0blw3Y6LuKrffvTEDdcXIrUxOoL0KyfsDZ7Qk626hKwEFEZhTCkesHccZXVn9b81MDUk
         PYXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfc9yZw6PD35aSxI+a+lJ72eQoyk7CYugh11eZ/4RBF7OBgraVarSh3y509rrJksu7n+5+SFHGqx4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWXcD//IFJhw+n39SkXdNPwEHUDnGLCdZlbca5HkrTMIR9vnR2
	HMGumfPGSmv9eWG15QbM26bHfZc0qFh4OC8vDUyc1S2P4RO60BeHVvPX3x6kAiuXBKMGaHfYmte
	zpYp/lcRx43e9+N55PwiDLmDjXfptSKLfzvIl5TUwZpKy5o6UKhcFgNUZPXfwj0o=
X-Gm-Gg: AYBFou2T5sj+dkdzy2lpxDhDuOO7RMoDr1C5M3BcTsLCHejZ9B+rrlY2ldRjnyk5jwJ
	dhfLnTmyEJOE1em4h3aKsoDzwDhMGnIYpI6T/KxQsnGnaxvWQvEhdxlGF0J4o6bnoYvUMjb0sqm
	x3UJ258Q6hj92xmycicP6lqt6hhJBXy5tkyXuEglM16ZKAGLcP7F6uVT3Bq3mXcoxNQyfY/OTNC
	zsujI5P39DTNuZaSzZQ0p41oD8wdHKm2e5lBBzPVJ/cxRplUGlOugmnx7NuXk7aHUCk4VXNN7ZD
	YgMUwkDSOXZOsgAbIqjMcjK0OmFjPR7PUVSHyqn15BRSCtcmmKhaFvSLbdhAmiSV9Io2Dmq+WOX
	DrGAh286zBx8OUhG0pu3NVbilsuWmvA==
X-Received: by 2002:a05:6a00:908c:b0:87e:35ae:783 with SMTP id d2e1a72fcca58-87e9c53ef9fmr10079867b3a.51.1790583237181;
        Mon, 28 Sep 2026 01:13:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:908c:b0:87e:35ae:783 with SMTP id d2e1a72fcca58-87e9c53ef9fmr10079859b3a.51.1790583236769;
        Mon, 28 Sep 2026 01:13:56 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feb385ed8sm3799547b3a.45.2026.09.28.01.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:13:56 -0700 (PDT)
Message-ID: <553b2e77-d646-423a-9a80-4d0ae539b919@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 13:43:50 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-nord: Correct camera clock source tables
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260927-fix_camcc-v1-1-9fe956f01f6d@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260927-fix_camcc-v1-1-9fe956f01f6d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfX26Lf7H37rWNR
 Qv2UzWF2cJ0qJN9z208IFMuZ0/9OkLKwz8DMkXIuXP21Anqhy9bwE49d4PtyU+r5QMB3vg/5mcp
 nykMrqYHtvLUxEwEKT4RJ6ClLuJbPxM=
X-Proofpoint-GUID: OMHqoUUaVT-ROU29Khj3MSYkF1cQk8vW
X-Proofpoint-ORIG-GUID: OMHqoUUaVT-ROU29Khj3MSYkF1cQk8vW
X-Authority-Analysis: v=2.4 cv=J8U/fwnS c=1 sm=1 tr=0 ts=6aba21c5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZAC9QuG5zvkjJuggSecA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMiBTYWx0ZWRfX0DnxPfOYczr2
 uB64jqGajDbLPAaZZMIMcWMvprvsTBqSPeE4ERmgbP1N7zGQXZSRB7nSMmtdLSzKI5IZ6F9ZKV8
 tNstbxuQupg0hyrJswNzJ2llNSdOXHrXD22UNyYnlp/d6DiDzJ6XWZifq6qRsbNHCJp6kYFtyrq
 IDGWFYzt4qQIJ/c31fFy6dPiRSW2I40gnQzsVgnAZGh2uP/t3urFNQTki+JIWxs8r2y6sQLl3mv
 JN4FQFa67DzjETchfqeuwW5bC6f6cpkaMvy7G+955xA2YTAM3Q4Vewnq3XqO4g9XYMqSiHZ44Ft
 x8y1EAESqIncgEkVv3RsohNQ8YzXM0r1rac4wea8uBDJiAI79TJNEmG25l++sJp83iNmKef4oA5
 9QMLbfZ/K3OY7E4sIyBFsJ1TZmDz3s5aaH1S7MNpRhwO77oUlB3YWJZp0qDub09wlttZGkp9wvC
 DsJqBtoEV25V/CJR5/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280032



On 9/27/2026 12:07 AM, Taniya Das wrote:
> Select the PLL0 odd output for the 200 MHz and 400 MHz CAMNOC RT
> AXI rates.  Use PLL0 main output dividers for the 300 MHz and 400 MHz
> CPHY RX rates.
> 
> CSID and IFE Lite use the CPHY RX rates, so share that table rather
> than duplicating it.  Remove the unsupported 300 MHz CSI PHY timer
> rate.
> 
> Fixes: 7647815dfc8f ("clk: qcom: camcc: Add support for camera clock controller for Nord")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/camcc-nord.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 
Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
