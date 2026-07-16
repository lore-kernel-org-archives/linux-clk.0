Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480D92580F3
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 05:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784179228; cv=none; b=KwdIfooWD7iFS/E0kUZTnT/gu9wgQIbGzDaj/GXP/dKhyFJawux+HMf+ZbJzLKZV4709fK4hDHMY56O6Q59/c5q57HXDORdG5hzlmAC+eTjVReM3RBrXL6Scdw28cRzNDj3oT4DOp6wU5thRgDzB/1Jf+l7Zi4NAqOK9JaeXmz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784179228; c=relaxed/simple;
	bh=LF+dMpkqOYdjTuOhecyx5ov7eIVWQFwsydn6zw8WOFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pLDgdbrD/YodB/ky/w5zz13FydWIpdIa228ncZVGkcQiIj6ujhej2+LhDFWIil6Fk5MycNgrZpjXqfLlkK0iM27zLczxzigAegLKDTaaSIV6lHQih1xSS4ogWv2+rfVzIkgWeJy9Jt1Ml3MD/mHlZRUDv8sJWKCOHjrThv4Lxic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FE1B6bDX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQWTOSqz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FE1B6bDX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQWTOSqz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wSJQ1573494
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 05:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMZATvcieI+jey0EZMGR+VZBj7ajNOX+MCFIugsOB+k=; b=FE1B6bDXCuo+U2C+
	5PO2tZX74zZx29UHWHvilD3Wy2kPQscA97d77bTF3ZZt38AorzSUArCk3JRcTseK
	pEQsAeRl/Y1kXu+3kBVL2Bpr9QNLBBW8gp+Dr3VGI2HRrpMk0nebQA+nsQnqiSr7
	f9yjBZgqIhzNUMHufaY/mwT4Lj18xYd06w0x/1+XA/WYdPldGGftZJx9MdhXiulJ
	fu1DQTZHqoozAvfaTGF0xxZWNclruyWecK12HAecbzeWN1wHf4yQvdVeTwJlst4d
	cN60soCiI+L9nmGlvR7AuMzcZT40T3eEh2zy8j3mD54qjQ3JHCiTbjNH4/WBFMHT
	XU+2Fg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7q642nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 05:20:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc5faecf01so119027745ad.1
        for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 22:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784179225; x=1784784025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMZATvcieI+jey0EZMGR+VZBj7ajNOX+MCFIugsOB+k=;
        b=DQWTOSqzizSkzif/vCMUpa/tbYgV1bHmjU7f6j2l9dbIqOWrYUhmWbquGSgpJxZay5
         yxwF9gv0anSLQbuf5XROau9SVt8V6djzyUZhoPh45RrnNm264tGe8BAT4/Ty1Jw72bAx
         TV/zuBzTv3wCL4ouURSFaUwvwnGc7HeahQoAYHCD3gxHsEaJua4nUnJjLk08f98ThA0J
         LpPAQwujhpYivLTB7xxaWxMYfNoRvWJwQNjE61Bt7i2oKvKUkd32J6y7ZJ8akUkjZXDd
         G6GCzRwF84wUZmOj51jPBE/RJkJK8W6oxUXTc1/uqCY2f0szCRVBi8pfAmpj0V3S4rac
         noog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784179225; x=1784784025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMZATvcieI+jey0EZMGR+VZBj7ajNOX+MCFIugsOB+k=;
        b=L/dBnOW3yq1JaXubyYql5+sa0CsNrVHBtWmvPtDS7uzWO5RLC5IcqW4Gsezal47MRT
         dfCfxQ2q6RnUd8SK742cVUuUcakcBge+NfldNv1bdIrR9ueV6AcKdbXFtMjWYJtDunsd
         0j6lDAqwYE1VAjazs6Fh6pBL93lF+O9/zezihQwlry+Ixxp8mMurj1+paGjL+9a5fg8w
         cRiR53iW75zP7RS6Oqk14NgMuNZOKEsuKiHQcq1A1MDrzjvp7l4pquPwtOuNJiH6emBg
         fYRZQ/ZIUMwAMmxt3TZXOvdEELdEJCkDNDUT+uY8pai2SaHyxlm/tMH7XTkVUsKFlY/5
         6BYw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5flpuvkCCe5MuS0VlSXlhKlQSf3U7yTylYxpApt+f6dMERX9LNRDP7NlUx8y9iFNYuFUm/OYnmqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwupFWxpI7WvsgrQRp3TDD8kDSYtGZfdNJqbR83c2AlNaMh0ThR
	uye/ommGSPVMgSgwqqOGZUrL+46VkCdW5W35IBsm7yRTraNczj76M9KD90igNLyzifYO7q+Ng2K
	aJUEZVL2UrGzOwFCdCm1/cS2V0AcJctn+ZGZ7CQZ2Z4pdXngV3gGYpapTa6yqn+4=
X-Gm-Gg: AfdE7ck/o0yFzWYXAyyj0Crr1qC4ey88sSaIDfCme0brCtZDdh6DQacVIhB6rHHKGHW
	TRke000OA3KgGHIQR2T6wpSbCokaU1RcTiC0MT/Rt4/vol+sm5YCOrNpeF+bcCbSFslVi09FTwx
	4u9ABZW08wy8FR6qxbyRdux5d0OVLnRuFuWwO4wQqdl3hMVfYLMemWOWtyauH9K9/3QPxkMPSY+
	+aaam+ushs+33sllBptIXdT2GLVCS+FUBIti0qz7hC0YubxvvTTxfTNxs4M8P3odxQ6y96Pl+4n
	DgrKN/CzvbbwHk4G3bK7LgsNiNlgKrebtNv7OeJuqBRsloQB85JDlquX7Qb/Vj70DSBaS09/fzk
	dgM4uh7OLAJ0qZ73De/GMGMUmS+k=
X-Received: by 2002:a17:903:9ce:b0:2cc:9e99:55c9 with SMTP id d9443c01a7336-2cee9b590demr113452215ad.26.1784179225225;
        Wed, 15 Jul 2026 22:20:25 -0700 (PDT)
X-Received: by 2002:a17:903:9ce:b0:2cc:9e99:55c9 with SMTP id d9443c01a7336-2cee9b590demr113451855ad.26.1784179224793;
        Wed, 15 Jul 2026 22:20:24 -0700 (PDT)
Received: from [10.217.216.90] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1072eacbsm13535555ad.80.2026.07.15.22.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 22:20:24 -0700 (PDT)
Message-ID: <cf144d43-907f-42b9-a877-3f54d1da088a@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 10:50:15 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/10] clk: qcom: videocc: Add video clock controller
 driver for Eliza
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
 <20260713-b4-eliza_mm_cc_v6-v7-7-4d91bcef50eb@oss.qualcomm.com>
 <alYq2J6hd06g9XyC@monoceros>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <alYq2J6hd06g9XyC@monoceros>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA1MiBTYWx0ZWRfX8COp58HbjjtI
 YfLSZ/CIZUN7FtCunASxeiNR6S5/oqnORqbiNlvFN6dx2kkqyesl7iFKPU+NnwZ6gjvUrx12C+a
 M5vZohx0tbsD1JUspWcGeHjdWAL5z2U=
X-Proofpoint-ORIG-GUID: ulvs0k5BaXG_kxFN87Lw7IaVRBecEHy6
X-Proofpoint-GUID: ulvs0k5BaXG_kxFN87Lw7IaVRBecEHy6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA1MiBTYWx0ZWRfX9GnVb53vr1LZ
 m+E0XtLH/icbcQZOaCBcpBk0K0V7zHXPskvQQgmGccfYPOUoU5j3iLLWDWH21p1zSf0gAz4BbqP
 mCoOfhV7T1DxGTVKnJ89WljUHtqE/DvLkAENpAUD6DQ7PKYrSdaxU7ySGkRyfyE6pvpFMeEeL8w
 ItlLBh6SSyqbaxJW3syXCYo6xZUdoPpaUoqmx4EVYzazPajpFhkrUepJe0BlYvEPRLPz0fWf+T8
 lePDOE5XH5f3/G2uakECnxzHBjzMCP+fOz5nRUh7ciP6GlacRBa/fmBUp/VLDglut/vhlK5BWcN
 TbaDUGzjRUvRLeDTDMYlPNc4t7XG5Pd7Hawq5HV2wwkdfgc3Hf8LOFXs/eObqrEDYfXbwcaIbxq
 YwFk4MI3JgHAqO9Cz3ySIvh6G+OJv4i9/pxnHYqjDXtgeEw4T1dwoX/Jw/1XfwmNtfe1M4w+F2b
 Tnqa4KSbJXMpIQMxN3Q==
X-Authority-Analysis: v=2.4 cv=BajoFLt2 c=1 sm=1 tr=0 ts=6a586a1a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=GXRrvyA9IJ52Cl4LVy4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160052



On 7/14/2026 5:57 PM, Uwe Kleine-König wrote:
>> +#include <linux/mod_devicetable.h>
>> [...]
>> +#include <linux/platform_device.h>
> Please rely on <linux/platform_device.h> to provide of_device_id and
> drop the include for <linux/mod_devicetable.h>. The latter header is
> going away soon.


Yeah, it was missed cleaning up.

-- 
Thanks,
Taniya Das

