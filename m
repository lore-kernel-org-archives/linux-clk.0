Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52C92F1FED
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 09:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763458398; cv=none; b=puxIFymUE8lUmLwtgUvHYmqnLYgqfmk5JywMjXsl7Rmb9CQ7JAWqB8T5prViO6iTn1LnmB7vzSwHCpQ8PzqAgtCzFJ/XuBURoP73FScazqsgMVkjflWCxH8OdjhkD/z8bhhpe7HaxWjwkfWSAT+5eudwP5kQxx8uPvC/7TqRaSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763458398; c=relaxed/simple;
	bh=UQIqnD2S8qhSUUosHxjP9X1H/0/spwyja+9fJXAYG+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oZ6SEOdoy6gmevsnGkYge0hQZvmwL0bs/xn5I9HNrO/gDYNU1iuO9Dwr69ckgXVhCt2zv9ndNrA3pPULRQUdozGJPlWUSO7SQbeNkavCvRPieI5FVzxmmP9XmGt9GVut0FcdmFPye7pGxiTRSjB2EZh6QcVtGMkY5TAxSnjJeOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nokr6R/9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fouuPRZC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nokr6R/9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fouuPRZC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6SxfQ386625
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 09:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qv39UFkyCOPqRFmKEk2XhdOqhtGR/Rmbfy+cLgF1iSY=; b=nokr6R/90UqZsMaB
	pFxHHJuJ1VJ9ZmvB4zybOaAhFuFIkr42UtLT5uwMrhxOm7ktSCSmmWZIKhI9GoWX
	uBz+/OPWXNl83QNYwDKaMb46+D9Ud7sr8dB96HgRk8ia4T2GwZ3ChEy0wQKKRAD9
	BbpjOP9HBDpKocsRDdxxaA95l04BrqvZGlvE9qr0ZjOB3eXnKaisU+muuwnZAYOZ
	96ARzqHcWnkW90iuhZalL6E8u/JNtvkiNQkh/tqnNQ/ComTnROgGyONvsWPtXib0
	3DCejT7bxw5swR3pkm7/uv+DdPLgvv7P5HeYQlJMe1rr0B5mfbTYBG4eUkFZ9rfj
	MM+sQQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8hxtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 09:33:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee05927183so4446791cf.0
        for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 01:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763458395; x=1764063195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qv39UFkyCOPqRFmKEk2XhdOqhtGR/Rmbfy+cLgF1iSY=;
        b=fouuPRZCboesz1RQCSdh7kIC6S90YBi44cct8uFC9iuM0K5Mbn/TNX3U/DOFPYD2tS
         Zr5h4ICsODMxJiMbsXK+VDrXVcGcm0LwNXSatQB9lRhnJ5TouJf4agrdnAf+WJbw8VEl
         5iD5rUT8kojv2ihXvmumdBtfVXjPW5+nMOKCRvZ7o4WO0VRyWcs5VXyHT87IceM0bDZ9
         OZF7nsm8VI/ISvN1HcDuuQKjxyK9SFWP8IRTN9IVhsuP2LKwOa/F7W/X1kSYqh8lM2FU
         rlIBWw1oFQ16HNfpq5fL8/JfY3Wdw4yUkDrZjFqZDtc6u65g8MoRrj1xhxoDVmWcIce+
         ZeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763458395; x=1764063195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qv39UFkyCOPqRFmKEk2XhdOqhtGR/Rmbfy+cLgF1iSY=;
        b=cnsaEKWfaYk6WiY7Xri1MI7wSOBo5FLpBzJOMYmYdD5OceWzVZeiOg6xFj73oUMvD2
         DE4IzsoW6/p3mOquUzoUh94T/H/rZWRsBtORK07Y7HpNy9p4cW7FkDs5SKx/fYRJRddT
         hSHldV+qDvnrcsXTfQsxZ0lRmWP+FtmhwauEVo2sV93giaXXiDPwMERspOa7ChigZeFb
         m0wMQzAEYUu9RjE9fo5oftSrTj9gpNJkneEkH8RtzPjB8LsRP7YdhhO/O8pV9mIfyBk5
         vUOsQ0g8KdScRyW0sEL9mNLvLiseHhGvJ3z4OopF69vEq2OmFaw29BDlQyj/fC2e703I
         v3CA==
X-Forwarded-Encrypted: i=1; AJvYcCV3BHFA07px5k4R5gmILUyCJe52rSdeK2YLYLf0wRRncRanr0mtNol/7nMZPIzmPgeGlVSg2dyR7bg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMxa2OeLDquBPoHJbV/rD7oJXxsl9bF6jk2i8ZgRCic8tdlGdG
	2vzthuz7NAhkxktYFj+9oduZaySoONY3ZnxtHu6KnliApcKXh0Vq9GMz2hCsesDJdXwh881ImHD
	x5Z0U1eTLF8XATu+9vM6jN7ozR7LkHpZnchGHnSp0XWl5d7Qp8IIlUTiJ7cZJbXptbNtWWeY=
X-Gm-Gg: ASbGncutK0PZ/gmjsbOPZtLSxfYxO9gkPFusEX0ETIXswkzcczMZ+jOgpDG7cU5l2z4
	TAeASSiAhPlA01OxvCNyzVOMx7o4jXG1kDaHuBBO9UuKJAalDR/Rydo4mjylBxiRPB/VLWxuKGg
	L0cn3oK8DneHq4SjQFG0MtS7OI7QSyvMRjDhyNUSV4r7y6nzjqW1DAdMOK12xeNdM801qzys5qO
	K4AvDwjz9dqzDa9MEHwJiPj57Nw6W/PoZ80D5nxkL0GKkikEiljKhn3uHth24eFPcoLYePP9XCa
	B3tZ7kyuKrfHcAwJwrd5CjD3qP7fOfwiralxcfMQVyDBUXAbiGLYJPHMPg5Q81jolDz8IP7sJei
	D2UJgD1QTVIzreOcDzNuqJ5rPNWf2ioY3BRbaoWWnMMCNO9I6RfmA9chJZO+Ub8YgUNs=
X-Received: by 2002:a05:622a:118c:b0:4ee:87e:dee0 with SMTP id d75a77b69052e-4ee317b615emr20177141cf.9.1763458394927;
        Tue, 18 Nov 2025 01:33:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXbp71/wGMsCkl9kj8qW53hh43sPKd45qH7WsYKgUAc35qCTahzIoz0OdHPPgWiMTOyBDTSA==
X-Received: by 2002:a05:622a:118c:b0:4ee:87e:dee0 with SMTP id d75a77b69052e-4ee317b615emr20177051cf.9.1763458394574;
        Tue, 18 Nov 2025 01:33:14 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3f961bsm12473980a12.14.2025.11.18.01.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:33:13 -0800 (PST)
Message-ID: <6b757b7a-3f36-43c8-be25-8e7f114634cd@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:33:11 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-msm8953: Remove ALWAYS_ON flag from
 cpp_gdsc
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Lypak
 <junak.pub@gmail.com>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?=
 <otto.pflueger@abscue.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251117-fix-gdsc-cpp-msm8917-msm8953-v1-0-db33adcff28a@mainlining.org>
 <20251117-fix-gdsc-cpp-msm8917-msm8953-v1-1-db33adcff28a@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251117-fix-gdsc-cpp-msm8917-msm8953-v1-1-db33adcff28a@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eETs9XtmCG5aBJmM5olUFdI0sov7dJJQ
X-Proofpoint-ORIG-GUID: eETs9XtmCG5aBJmM5olUFdI0sov7dJJQ
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691c3d5c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=bwGweEJhbDxPikGuqYQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=UzISIztuOb4A:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3NSBTYWx0ZWRfX9ItScZysYRlL
 wQmwcJbc75ZFbjxiZvK0/4q/FMewlQ2KONeoXO6AftGb9L9beiFq09vEiJeCJn5adU2qGUD2MgC
 jYqxST1m9VmeJdQT3dNrv41WOq9SBSPu277p08GJMAm6ENgEr6WY6DmQ2rcBZnJ87lQ7sOfUhr4
 ImyMQk3l14cucHGSh4QbnEuyq97y1GXZW/rNKukIV9e0bQKqy+Hj3yyY/tXTNGv3amHX19R3Whk
 8eRkpCIuUFo5vM+4X7N4+lLp8pIafoQeh98adiOa/ygEh7pU0xtB5nOBY56HBhJ3qmUk2BlAqqC
 QP/vIPaCPMMsiqlZf3O+fZFfL3WHx9LQr6wJFbTDhmcKtRQZC+uCMDD16aEJti9dTlDZ+1QFe90
 9UAjlsNuOzZ7UKiCEBvxnUSm2lDQ4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180075

On 11/17/25 6:58 PM, Barnabás Czémán wrote:
> cpp_gdsc should not be always on, ALWAYS_ON flag was set accidentally.
> 
> Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
