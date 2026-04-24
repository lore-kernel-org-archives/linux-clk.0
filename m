Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B6A212548
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 11:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030492; cv=none; b=Xb5eS3Hc1jmG8nC+0GUMH8pjDhozNMVZHtOWF9Geg81qT0//d5wPW9uZ6wxpSm11nVDesRGiCiPkJKG4Gfd9XXSJydwRIxciTqtpWJDRGyWl6SHJe2gff77nsOJw2qzWkDSk4xZRyHjaO/iVVDc7TznLs3J30BwRtNsKoNo7Juc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030492; c=relaxed/simple;
	bh=cuCKH6YcmagYwOZiieg6yMey10pmTjCyRaw2ZACHAMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N3tsEJHDB7aHE5cNzqP+8v+n12yVlHgLH7cb7UomfpgtJSCJ+0whrgoHW7EtDDiRieod5jvPqMObXm1kZqKh4lVurcyVTD5YddftmGvc/r8mr/D7mxjEGfkyq5pQa2WEEFHSjz4pKpxJTp5gC0Giomb2P6gcSdpoW6U/rBI2uG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aK+gM500; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HY0Qjreq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aK+gM500";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HY0Qjreq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9j3v7756981
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 11:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XBKKALhIGEeAOKEFlIPER1AMTIsq25/lJaVNg9OX6sg=; b=aK+gM500uC1nE7rD
	C8U8z5JWrWxP8zn5wrVfn3GxeNsJRmsNDpnDhwUiaOn56+xQ489aRlq8h4Lnv4hD
	cvpr5Wq8Ix/HFcqzvLqW0C43uxhz9hnGKDWL4FIW/dpO9beTaf4+CYac4PRfgVNV
	nZdV5lOtmBLLmHgHW9w37Ui+ReGC9in0nCHshPbakWMjSMaDZD7MzDQZAw5uFFZr
	lSjlu1rvQgsJr9nMlIO6Bm3vNwZhulKH5i67V4ipLGy1MiWFd/0m+TjjFLYNizrW
	zvfr6U18W3euZXVHcxhwlyGkF5CNRzYFPVD3OkenFo+cl+7EaQhyDe7rSHwybAm4
	MfTE8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr4bktat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 11:34:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9f1bccd7so15100711cf.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 04:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777030486; x=1777635286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XBKKALhIGEeAOKEFlIPER1AMTIsq25/lJaVNg9OX6sg=;
        b=HY0Qjreq3YRGcGwGndkBPS4hB5Olgfw/qBMhL4sH2+oHovI5eEJlhPCS/P0yrBNL/M
         qKV+OjrJ4kkiX+dQ5jycG2mEaVA0S+0Tk28ILO+AMKbr9linKbq1iZ1aId05E2P2YVAX
         tGbyMZyPH5cu5ri55fnemilF7AXbaJSb/pQeiu2ac9EZMrZcXUOyyexneXSu0Fj9GYbO
         KfY9pPkJS84RMvaerkK5REX7bomuofYrp6UwuHcfp1xNS00PhRba9+JyA+AQ82EpMq8r
         HSmfustQH3DaeNN3A1kmj/Z2+nY2XO3c6TGtYfZO/rvTZcowwPnURIllrgnVzdkv1Wus
         dNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777030486; x=1777635286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBKKALhIGEeAOKEFlIPER1AMTIsq25/lJaVNg9OX6sg=;
        b=kMUsabX3R5lOF8MG515LxUJD/MzLaFc3hKU0MWUCl9NMFR65mfEGgk06+X0k2kXEuT
         2RWRHd/Q2Hcq3vjSa6p9ndQzHGMa6ResqCYbXB3vigtzhzv6nWWyHDMUKr2qaxzMPuMx
         p6AGKdxT7FcrPYeI9n9pcPiWf3VEtB0u+dyr7zABJvWVIkUHPm9e1ygR8QwPzuYmgYJp
         X60bTM+uLI0FyjhLWRDKksrbjha/E5IuqD9TSc30Hnw1ryLSX49W/QEP0ZxBfZa+VaCR
         3d1c3AFZayo2xSzKCzPgvCpBdhRpFzhc5o19iHdOedke489yAmoz2mfp4/8chs+CqyjU
         QYdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IDEzN6AswzX9d1XbhvXZb+OHSKPd56mtKTHHJmgJw2HfbBeHOA/0tfQ1oTReG2J/aBkPJF7ROBQE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl8XuFbR8+r1eAk1FAfciGvY5JcfW77uWuQmlWAX5oXPZNOoNt
	KKLIi2bDv1iAVHpqKm1hO6rmUCYCg4e9uzaGqFzLGNW73NRFfEEWINmqwYULrN/X35IV0zE/9Hc
	AB0k97X5lMrBhUCpstG962QwRSk0JPh2UEldh2Wnei35Z2iBTGJrrbpGCAvt2Yyg=
X-Gm-Gg: AeBDies9A7rxg37k49J6bzdqGIk1ujH3SamPAE8yDgl5ou5/THpOeGYB3MuDcHmfL+G
	7b1vGM4KtC3VAf/EtN8OEEgrmxDXrCKeQ3aVsce+H7PuvkXtie/eSmu79xcuDjY5VEW9MMa7jZz
	yAjgE9yK/p31AMpa1IJ7hyWK0PBJ1UZAkCRUz9xrkGLLHd0yxrW4GFwr0Ej8uSAxjL+q6LC4gmL
	mccjjf3X8EbfQXNsbmoLzuK4SMPoIGIZZwEQcLlCxHp4oI8uhyds0q7c1gY4tzC9v6fqtzYoFK/
	a+E5UGzdeApZ/WlLn7Qm6guLTTVxFKfB+OzSLIdltsDzUPHDsS5HcD2KFsJy3E64ljjs9k7edui
	G4uM/ViAIuDhfOwf0UX1WfhjEfFEvCGdjF/BXQY3dhxEEe2Sh7AOWb+qwm8VLTfl5QyNm/6IgtW
	oT1I72R9R4x8vtmg==
X-Received: by 2002:ac8:57c9:0:b0:50e:5f36:1daf with SMTP id d75a77b69052e-50e5f362870mr223601041cf.8.1777030486065;
        Fri, 24 Apr 2026 04:34:46 -0700 (PDT)
X-Received: by 2002:ac8:57c9:0:b0:50e:5f36:1daf with SMTP id d75a77b69052e-50e5f362870mr223600651cf.8.1777030485653;
        Fri, 24 Apr 2026 04:34:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d5d8f9sm4701356a12.25.2026.04.24.04.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 04:34:44 -0700 (PDT)
Message-ID: <c93df63b-6544-47d2-92a5-d6f2995e736c@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 13:34:41 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: camcc-glymur: Add camera clock controller
 driver
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
 <20260402-glymur_camcc-v1-2-e8da05a21da7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402-glymur_camcc-v1-2-e8da05a21da7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExMCBTYWx0ZWRfX51Ei7v8NeZyW
 dNN9swKZo1l3AVHyVn1XrmE3/+OLFODPtHQi+WmpefwD27YG1i2lVv5a7FXHsBSTWXrt0jy86MZ
 C0oo5UZ1WHyqmAunYiUCOYawWm7cp7/+ZUie6Op8JY6ioZLkleVspIZzxTrER4us0tNtP3kvo/w
 /VFJfBvej7fhYyMrx3Oa4EY4gjVUn0oxDFI/DEd8xLbJSo6LzZ1FCPgKuBlmtSMKz8eoHfBCwc5
 cqaAn+5rnLWkZs5tO/11Q5ODGTl6I5f8zm5LygHSinI32UfFWBHDS1vXNW58r2iPggQO3cAt8DS
 DxaoxuVum5fb0etBH2wm4643J514pWellp6gKom5M67clGjuJZtCcfggdOH283uUcFz0QVqxOUh
 01BZKMVutMX4KW1fUV1I4e7sp7nPRAHDdxqt/w/GJu5koILvCt1o5TncvfgbxlUIy9IsPVwNjEr
 4B+Ng1sN8azLw599Y8Q==
X-Authority-Analysis: v=2.4 cv=TtnWQjXh c=1 sm=1 tr=0 ts=69eb5556 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=i2Go3QXZGRdFdhsXBMQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: qj8pWZ2v41-eVlZOHdouYEFlVxIcuoDN
X-Proofpoint-GUID: qj8pWZ2v41-eVlZOHdouYEFlVxIcuoDN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240110

On 4/2/26 8:15 AM, Jagadeesh Kona wrote:
> Add support for the camera clock controller for camera clients
> to be able to request for camcc clocks on Glymur platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
