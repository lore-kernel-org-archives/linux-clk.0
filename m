Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808273D091A
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 08:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632079; cv=none; b=TUZhl3Voie8XHV/v5m74JYs3W7rNTR2K14pOLAxg63Jv8T7p5eh0jGK5uquX6wGxYGhPysQh7v2quznHedXOTxF9vy+IUeAekicyacPGO6Mh/ea1+Ke8DWd9/o/77EKvAUxCYep8kcI+IIZyW9TUe79lQthrY1L64d7xMssZqfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632079; c=relaxed/simple;
	bh=5n2spNRAVJiYvE1gs6ZNcCsL0cuyjrLDepDe5iIv0F8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nB7n5x1uuHUI41SGaHRjV+xAyf9dMyouureQU9RmAa8ADlc/rKYf5M1dmN7pNzBZwTwHUYiX9MWm1K32c8nbKqXJO8eUXXpjCHlD1bz244wgkJrResyl2wgr69ZoncKMxYqyHnSsUzdizEiPCdAlUra4RMfvAoOfyMDceSvM4Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcFJpSvL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQal7AkF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcFJpSvL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CQal7AkF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H605cR091624
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 08:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+mATPRUT3aN3EGbGAtcjUHmXNV6gxh6oPWEnOj9OTNg=; b=pcFJpSvLfUHY2h7G
	qjfi3pTGF1CAYG91LLay5TK+kU8/jehpV+wOEaB1/hoNfY9oxu0+yAqnQPEqnMds
	pjC93/cs790/rg24DNlkGgzjmgufw0e5XGdA9cz7ZdR/ft6eZe2ZrYOOx8LpOBnD
	GSq1xwGyX3HJNMLJzF+fhDf/uKUHhLcbHjIsvhR5vDq5bGyWcvaXpYZlTnm+pGEV
	jfCIdlIldEo7L+4HvqlUWeOyRKyEELShmFqcF1hT8VJalJW6cDqLwfDhtX6QpIuY
	z6rHKzIt5kyG1IiJR6uq8vDrnSLv1YnBwLMZocLjKzPAa77Yk429rR+dhZ3j/pRj
	qpTeAg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw0uch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 08:01:16 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c6e562b059so16129e0c.2
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 01:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789632075; x=1790236875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mATPRUT3aN3EGbGAtcjUHmXNV6gxh6oPWEnOj9OTNg=;
        b=CQal7AkFj88w3U6e4+Fup8Thu6LPfdLVtk9Mn/oELPXJHApJ2L3qse0jtvtuOH8O35
         dJuJKtqMLSwvEc+8c8dlBkXgCZvgIQAHnasJHvqGTXzSbRHd36zEZtOX5/voplhSXHSF
         IrsJsHSK5uD6+swaOWmogaE5BmYV1jG5EpupTdcYLzf2Gez9KF/OtISyO4Nbwz5WFx6g
         3Jy5o9YRaTFSGBhbUJLEeoa/u3BFDRCdFRDyeCE/t2g/DbXA1ky0eWtfKP291opkIJwi
         ZOHozgP1IGgkoS+WkxRxgyDEaJG7j9xFxe+ZUUCYkHkmGqtLcjsJ48Y8Zzacgz7oKxTa
         6SOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632075; x=1790236875;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+mATPRUT3aN3EGbGAtcjUHmXNV6gxh6oPWEnOj9OTNg=;
        b=JSMNldzi9E+aoqyNrMFFNE0Dmw7vReXDDuags1aBpu7E0qA3YfsnKmNcd5LXWe7dFj
         ntBThCibPqQaZsklmTdKQkpyYwhM14LPBnGeZhnwEL/VGdwqqG067a5JktahrZ3LQA6d
         C7rZVmwmmezLcCDOvx5f2q9Zi4NZ1oHEN+ZwA8jfuw5V0B6va2mFTZDpXBpgoE+5gaoy
         +m0dSC81HrqZOY31y31AFfi23bZge1anHuyO2LPE4WC1bX0LFc0o1VvmGuq5Og6qaJmF
         qcVz8XU5qgez9CNMmFc1cwd2HXsiPMxcjB+JrJUF/fG4e8g6+kgTJ//wDBwf6xlPVPOg
         eNrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtJShHRKwglW6CePnyYcy3chTLorJKtgWbvoq7Vj2Jm2Ug8Mfc5ZEpVFo+ZMg0uid1Grc0bfCKX+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lXaxzWKK9bqL9Rhke9/bfGO6oimXFuq6oZsBSfT+bsBI2EQAr+
	bbEVJSfd/xyAC/TTx9EryXdUtXXDnv/CUWPVv8X+ohQj4IFUJbtOKqLdSKpOR/MhcKUN57yhZmt
	sR7k77ddp0eLLqHN1kDUVIcz/bVTLGdMLkgdqtH1O1XuEW14XzMgzYEQYtNE+40A=
X-Gm-Gg: AYBFou1RUNmo6kifJkURO14UVx8xga+g9tXXxJiSIwT7jwKheyBopuB7hx4rRQeRk1w
	LPH8OGq+LJZgddEOMicTHoNr8fH0NiMduJTOmYIsij6iEHlvFNQTYq8KO1AAUteBTUrztgRI9K7
	u4i3PjTFRdjREHz8vJpoY2QATOfaAtsEb2UtkjfwsN9DWdThf2GJ8hjzTs5c63rzwenPTURv+co
	9dvxfSoJ3VyQHTNWrbbeWvCQMTMIFnHVqMkH+e1nSjyYimMHo+P5OqPWQAAP7dspwxhCUziUTTM
	NCCL8uv5qcCfFof5iftowTB5I9YpfT7uh+pMkMYzuw351KxafZrwKOXJmizH5obdMwJKdG5HaB2
	2liO4wNRbOh0ZQCLs9f0yHA==
X-Received: by 2002:a05:6122:4a48:20b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c99abda5dbmr1895436e0c.2.1789632075675;
        Thu, 17 Sep 2026 01:01:15 -0700 (PDT)
X-Received: by 2002:a05:6122:4a48:20b0:5bf:b91f:3bb5 with SMTP id 71dfb90a1353d-5c99abda5dbmr1895418e0c.2.1789632075297;
        Thu, 17 Sep 2026 01:01:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d29a1bdsm3362760a12.26.2026.09.17.01.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:01:14 -0700 (PDT)
Message-ID: <d2653084-b3b2-4c52-967a-2b8cc805749e@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:01:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: mmcc-msm8996: Fix FD AHB clock register offset
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-clk-qcom-mmcc-msm8996-fix-fd-ahb-offset-v1-1-a575e1b9112c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-mmcc-msm8996-fix-fd-ahb-offset-v1-1-a575e1b9112c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BlqXAiHpJ7_jo-2BijfPwK3TAYuLOSoj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEwOCBTYWx0ZWRfX+V86Sa6TWHsy
 gIT9zBKCEJIXsZSMcD5aDDxIr4JWdBKp5dUkYVtfPDgwGAoF5pU6ZWicTr4cUT0TvhvLqHRmdKd
 9jIqqwjv/M3XubZ+vvgRLSgmtVrBpdCcvNuYasllQglDzxBiNzzDmRjkWYaHs1aue3HYSzuXkYI
 8E16W/zWWmGvKpTe3YCxHgVgIM/W+wzQUg6qvkbOxX+84xG5t8wHprcHdm0H4B+fY94JQ0VNoQv
 XK1CDtMqXBe2QP9SxNW+WFcTQOjAkTS73S9xpvwsQxOO0fqNRFMiGxw84wukExI5AHZOHqSdaxo
 2K7Wtx8DnoS/vmvMPOzGz5+RKonJZ9xeIaK/ETIPWh6eRe0zXxq58hFoBvXsYjVddU0p6rfmcBa
 V/AsBHBz/HP0fzSl+W2eFp7hE3KviMNw4/JiFASeHvfevNBmnF9CPmwFqAt7GpbLpYfkpQrk6bm
 TZw8uDp7rriQXpfyDig==
X-Proofpoint-GUID: BlqXAiHpJ7_jo-2BijfPwK3TAYuLOSoj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEwOCBTYWx0ZWRfX5HiqZWakMKVr
 +63Mb6VpEg2WY5lTWlhT0PdTJhGmZUFvoyEwu3MF3p5DUYLk7uYu+w1dmva0H6q5ltTlW2NQVFV
 t2kChAi0q8VA9SxWsfweYr2P5canQQE=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aab9e4c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mAKI-E3sSVMRA5yFQh4A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170108

On 9/16/26 1:45 PM, Abel Vesa wrote:
> The FD AHB clock branch register is at offset 0x3b74, not 0x3ba74.
> The incorrect offset exceeds the regmap maximum of 0xb008, so regmap
> rejects accesses to it and the clock cannot be enabled.
> 
> Correct both the enable and halt register offsets so the driver can
> enable the branch and check its status.
> 
> Assisted-by: LLM
> Fixes: c252659770db ("clk: qcom: Add MSM8996 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
