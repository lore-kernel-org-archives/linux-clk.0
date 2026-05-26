Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A153C5849
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 07:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779296; cv=none; b=SmT0GOy9kLi7rmEov0DTi3HTyYXfZqOw3k5SRQE1bjWc7Y9ZdvHTQFNfTNliXcdvuXGwV5u2l7Imegc+ex11jfPDJ9hpshze+iHMe8G021pKxtRyyYADRd6ycusm8y6XuS++jXZD4cFCuU6oAhuGEOPQPLnSzrMN9OI2+u+Zyr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779296; c=relaxed/simple;
	bh=MAvyLMCHYlFNNnu/c4mzgdBc6It7ukrVz8sWUsSPMC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FV2NLoEmeQIByB/8u9qLI8G5g94FUMDies9wVEAqJormEgqyfwKfzvlAIga6t2lJ8fHyz3ib+1B0KXfwZRIfo87uI6rlWxn/Z7WbJng2kcxOQvA1xHD8Ubm9L+nSJmZRIFGQQmOjyM5qhwe7iSeJVfWFUBVqq/+bADROus2tsxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tq2vT/ij; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bD5dbY0g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tq2vT/ij";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bD5dbY0g"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PMa71x1900336
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 07:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rlDqaJDlxHZHKs6avbBK1EMIaE1lZBxft0qcRVB9unk=; b=Tq2vT/ijSR6lNGVa
	zGR1Erl8q4HBGW5zAjTU7DlhP7jgiguRMNXdC3/2cbFcZ7Uueld0XTAmFQBGWYxJ
	saVIuqB2AEUWdvGud4MkJ/Qy4h9GD+UUl/v+rsFSU1Aq2TTliUsMl3d9QeHqvqfc
	0ejhoOlKRjwkRS4AyvjE7znOFA09BRHtBVSYQF1ap0ffgyT6EIz3M59HSyWpVzNn
	/JmiFes6BxwvLFnsg9AzjkPFY8VlBQBgx7bNSGWjUA2oNElNYb252svDk/Q7pWuG
	/AbpPTqLLMefO6o2y1UfhBaXizdPu6btryP0FWvwcE2TeA9tiJS0HCCacDDT7Th9
	O89dTA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpy2jt65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 07:08:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b458add85aso112769105ad.2
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 00:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779779288; x=1780384088; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rlDqaJDlxHZHKs6avbBK1EMIaE1lZBxft0qcRVB9unk=;
        b=bD5dbY0gBvRyLBwKxUiuAmWWorMp8Wouu0pBY78fuqaQ3qWfESJb4GoCV/X52CeLH6
         ka2unBG+jWczfRLktrergTgmeX3fXT8mANpLZHK2juzEc/5pFbF89wz1ZtiZPykpbSn+
         sGnW4wOa2pb4x5WH1Q5A77iR5tB1rP8DWLqMy69WMhygGL4M83va51uBzh6HIQjRNEig
         +Dg0iA2kCZjKDARumcAea5ebvKBxemiHIE1PaJ+kBQ4+bpJya8zR0l25UWE3SCFeQp1Q
         QLosgsaIN3OPXjlBIrJY6hE4dGMNVET7DKDT9pUAY4SFT7FlKxaIhj6tgmMEqaHZxJzD
         3N1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779779288; x=1780384088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlDqaJDlxHZHKs6avbBK1EMIaE1lZBxft0qcRVB9unk=;
        b=NNuDAcvkI7GjcdLoR3DiFGUgOwTvrSRVbE3vrwiTh3seDeChdLUbGiOeCpYLS38L6U
         CQoUIu60HOweSKA+91NXcajU3X305iETVqKKeI18egkm3hKzdDxz/hvDpUTL2Jeaxwoq
         gYtfM+LCAdwV+VFfk+14dt+Nw63tFnyyE+xIfteS9JZUz/fxnQm0xtGTgkVX+m4CESWA
         UbByS3n3ioQPGNavaWJ8QjzfdKXQOIlF4DU5MSPb6VB4ugGaGG3eqjbHtEDZJLihSqoE
         0gJ9vFUzdH3j3ioRrhjoEWxITmcAc+ziHpoSeulUfzm5utnQLWknNNXQDKYEo5e6Q5Eu
         Lc+g==
X-Forwarded-Encrypted: i=1; AFNElJ+3kYyxBcc15ZNGeOS5Eon7I2E/c9j4XasprI812XczmVOY/0DKe3Cz86mBi0OTVqQgZCEwcrRKRX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA13T7G+Wb11E5PXNvwWeeLj1RdhmF0z9KEKZtfCeJoq/lHCkS
	ItnCVFK9R6DsgjPxQ0rCASqSYRNV26uWbA9wYm2ocg+j9ZtuSuXqzOqoRreW3G+3I2b2qEkbkoa
	/+EFm9lO233/KcmnPkC56YUhCr9MgM7XewocCC1Rhlb0YDlzov0iPwhpg4yxfOTs=
X-Gm-Gg: Acq92OFu9lRSRjz6CWh1rOWCgb92QYcsU6DqCFZ8DzddKSUrvADQ3N4rHvim7EK5bzS
	5795H0jpGxlsdZ9oJeG+K2hUswnLANLrr6opJQIhxYmlXlP8hk1Lq+7OZ7cWOVCaKmX5yweOlyl
	+BhSClBmnCt6fGAubcePo6Rl52ScgCu6Ub/OfNlA9JWlKXAe1nl0Rywm4FfPLv3IkgqJz9njZdH
	5ee9IfwyMto5anUUDsu8M0/Bpi3osb7RDsKl7SNxeVySjGr9idrz7nligYszcGdjPF6gSmY9P6p
	UGyDJsxbqLGPATqt7k5Cme/f/DtKICfXkw1wtsq2AzOkdIJBkiAL/09mD3dz10nwZZz3JFkH1GN
	M0hOkTueMgrCmPkIhqgWGfLXYsBDL99PTLJlHoXRQIIj6bplA
X-Received: by 2002:a17:902:d58c:b0:2bd:eeb6:ff2e with SMTP id d9443c01a7336-2beb0674476mr186833655ad.21.1779779287820;
        Tue, 26 May 2026 00:08:07 -0700 (PDT)
X-Received: by 2002:a17:902:d58c:b0:2bd:eeb6:ff2e with SMTP id d9443c01a7336-2beb0674476mr186833295ad.21.1779779287318;
        Tue, 26 May 2026 00:08:07 -0700 (PDT)
Received: from [10.217.216.23] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695a75sm149210645ad.14.2026.05.26.00.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 00:08:07 -0700 (PDT)
Message-ID: <a96fd47a-38b4-4659-bf82-b26df31fb947@oss.qualcomm.com>
Date: Tue, 26 May 2026 12:38:01 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Add EVA clock controller
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
 <snnl3y2ekgosvrtwmbjbk6izxpyoeiicw3sffqqmhontaroy5c@rcee4gk3dkux>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <snnl3y2ekgosvrtwmbjbk6izxpyoeiicw3sffqqmhontaroy5c@rcee4gk3dkux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CriEpYTk3HGBW6wWWSvpehDmoz9_UYuh
X-Authority-Analysis: v=2.4 cv=ML5QXsZl c=1 sm=1 tr=0 ts=6a1546d8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=fn4kkkoX8VGOtbxjAn8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: CriEpYTk3HGBW6wWWSvpehDmoz9_UYuh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA2MCBTYWx0ZWRfX6b09gS9RonhN
 W2IPr3Qr0rqvxTUtlxSTTYApvRQSG83OjSreNsOI5PcG4qIn3vE/6zWD8tiOodLfMf04EQELXtd
 AKq4ls8TRIvyuspewJpGNZuQQBpZBakMSsGCvOMDuBM7n7mr8EOS0UZkWlQZyiO9l2z/HXAPEJ2
 Ywmig8yKJ23W6ByD+sXh6H2Tq6QzD/ne71rDj2n99xYR8UI995L85OCSv7fdOMEzlHQ1Oj9VXSb
 JoU3JHtkMLagxrfRcj97mQ4dpNe9SE+BYfDKeFHaZ0RrAUK8Sd1UNeiymTYQNZnPR1YLNsYayLS
 wv9g1xRYITVo1jm9xKHufBeAaqSvg0idKkI/4fNlyDD4mguTaysuLJZUjHPKA/iRYSGa8O3/Kqa
 cypY7vEkCPqtHC4ETP6OfuUKG/LqKBrNwEEifNrZmwbmJn3RBXh5CDDls/iSS/5HXi9lqbNG2Y1
 xe2w/6jUUx3ExZ5e7Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260060



On 5/26/2026 11:30 AM, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 10:59:47AM +0530, Taniya Das wrote:
>> Add the device node for the EVA clock controller (evacc) for Qualcomm
>> Glymur SoC. The EVACC provides clocks and resets to the EVA hardware block.
> 
> Nit: evacc vs EVACC. Maybe it's better to write 'This controller
> provides ...'.

Sure Dmitry, will update the patch in the next series.

-- 
Thanks,
Taniya Das

