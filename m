Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0275F374162
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 12:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403365; cv=none; b=OkHFA6cL95+wLSJEa2zLXrjajdHsheonFhDl1kQCQLCBcECzaizUgANf9kJgu4cyYCpwMizuWeFXQGVTjotxsbG0caG8XWkIdlGYxFV/zl6ff5lVBYUn15zXpZW23V4jwR6yYtLY1j7AgnkQVIEAMVhhLfFKP5V3Efib8ICH9AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403365; c=relaxed/simple;
	bh=odNxuZ2hFNSu8jD2vAcFjGgfyV/5IK4E8dvc2tmLiuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hC932vcDJztGmJy97FwJUTAxBPH6fgpkHkijaRlfu14oZPxWWnS1NDdR/sct5XUqp2fX41d7AG58+4VC3omN7zX1IZXllaQKDBxAdFCJbAlQCOwppg0hEEVLjgvT483Hdi5jXr56oBkXDq08rGZ8JsphYVOdZFvGkDkddXLV2x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l6jf8jpb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jYvUDFUh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l6jf8jpb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jYvUDFUh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9B56T3906306
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 12:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FaY2p71Y8woVoAKqknbA108WzRsqxJMopTu79NgnvF0=; b=l6jf8jpb4SnIiKgv
	nxlb7jzxD5YeRPvIhIYLcW/epYQgKj7hY/NLGjusHgk8H9yM9vaqQlQoxXcA+5MV
	CUQHuP42Qjp7JT26OnygNri9s0YZqMNe4AZ9Yrlkr22wFVecU5AgI7cv3wuXfAOS
	Qk9uQ6QQja1RO6V7nUYSHCdSRG2CZ/6HH9Sm06vTcjVrF0A3UWJHsu8rL7tIUoXh
	Jku3lNSHM2eYjpwGG/eLsMMb/NkCgZLNWPpF4I2FBKgdFULCG+PqVjZdrfDujF4C
	PEvpndY6yQOLQ1+YbBGfwEWc74eBtCI8aBqRu5wF4/bBwzIaEAzgs/sS+m79YK8/
	Kho9MQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfqs8hgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 12:02:41 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4179c6054e6so1859860fac.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 05:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773403361; x=1774008161; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FaY2p71Y8woVoAKqknbA108WzRsqxJMopTu79NgnvF0=;
        b=jYvUDFUhRzrRKs9gt2Gp77Vq1cwSOhKX8X7pv7kROCRCc3c4YgP1QO1sCHtr4pwC+R
         FJlKk+v4b1iZE3m8Pq3Gp+1LpAQhi+8Vi8lY7GUe9h1//OJqR7tnOVnFWFeFZPDRqVPC
         8CVFoI1MCQun0mqAwr5MV2skxuTVqr9qKYAz6fgJwnVOBAkgK41P5AUh0wubEZDr/LV4
         5jsrKIhJaedfVGs/yKmMSzhd/Xhdg046m0jvZ4DGMpXfIxsbA4JyDPM32EYRHnZ8+/CB
         Tol/gMZpRqxn/uZAYbZtUWl63zZ/FQNI4zjDuI/6f5x4B7lShGYVaZBNFlTziR24VMeT
         ascQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773403361; x=1774008161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaY2p71Y8woVoAKqknbA108WzRsqxJMopTu79NgnvF0=;
        b=CSeKu8WnpWItmvSrN5KvGhNCTtv4kk2tJtRVplFUHDaYt9B3nGZn5Z5Sx95cr+Wr+f
         WLb57CobgT0alIJOZ+jlHhcY/bauPDpPp+sSjZsuUgXUHV0AJPyqhN6/818cuqzXwtRS
         shoWd4p+eRI3nJaL0M0rBzcDRn/THirVnQgcob0UbX4i6oYGHjd5knS4htduTKX/JX8y
         astSQtkRT1iT8d/RNm3kTU1EnYYrb2ZkHiSNjVNT6E1NPSHAeHtXrZBFjow7Q7MEtxoK
         gyI3796qjjXq+7Zd9s5NuRvFyERTRV3vil5AyL9Vcm2Bc0CQMsbSurTtgkFsYcmmvdpi
         Y56w==
X-Forwarded-Encrypted: i=1; AJvYcCXOn660wOGLQGjSmQSbipL1RWbWuaqQ3e460YdlwbOVHN1n80ReoK+VBA+Pk1jSkM6PpMlwHiEFCdk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgT8vymg4+u/NNkEXGSCvU9uK8eMbG96LKoTtbNEiQviaxpQmQ
	EZmWnlilEWHvRMdWruaPqu8+N29sQ6jXx+anE6Zne8Zqv/xocDQcFAxszO/tQ2bK3E/gzduZk55
	X/RPZ9cuwL+QURThAptOIcFZz6WBUzuGtyRt81AJRZOO+vbdjcqNHQs8pi1GtRaY=
X-Gm-Gg: ATEYQzzSFrE1r1JdSEYqYNpT1O1K5q3o3Sanhgy+MdSPsxXkr25SvGFrQ2hD9blSNSs
	LBmH3LVdlR7ciS8FAfDRJHmT6WF8EmUfCH+UP+bAOoiWdav8fhmUXlnqwBbdJ9jP+QUNvZ1xMQ8
	DzqK+mgrNpKSHeihH+i1Ycycbh8u2yzhpuIg5CKrUX11R4vQb1mHTDm5Sa/yOYJuJV1WvawIA/i
	8x9cv7RvDMzLwjGFrJBhvxO5LaRVfGc1qXMtfiF6VsdhzkJZ8wPlLra4hwhmCl+PLGWTm6lmy/e
	DcZrJqIocgD23/8e2hqvJGL6ZgGh7wNQLjXQFdYRUVpFI0GKUitRkMrk5e/TloRoiv8d1UdQnVj
	Ps5ifNROb4tQitX0oZohCWQt3LVd9tLXX2PfJkq3B2KNY+xmMbcwtGkNlBtpVcTF4qACTy55meR
	u2A2Q=
X-Received: by 2002:a05:6870:d146:b0:417:48c5:5982 with SMTP id 586e51a60fabf-417b93f4be4mr1352563fac.6.1773403361036;
        Fri, 13 Mar 2026 05:02:41 -0700 (PDT)
X-Received: by 2002:a05:6870:d146:b0:417:48c5:5982 with SMTP id 586e51a60fabf-417b93f4be4mr1352533fac.6.1773403360471;
        Fri, 13 Mar 2026 05:02:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cdb1d20sm40152166b.41.2026.03.13.05.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:02:39 -0700 (PDT)
Message-ID: <0811deda-3763-4092-a4b4-8977199ae4f8@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:02:35 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: taniya.das@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        ajit.pandey@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        imran.shaik@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
References: <CAH2e8h4R-nF+eV+OnkSySKSY5_H-V8Ndyfhac3=VNQ-bMaBeFg@mail.gmail.com>
 <af606d6c-3ce3-4342-bd5c-ce3ea28c6923@oss.qualcomm.com>
 <CAH2e8h4Vp9fJYAUUbOmoHSKB25wakPBvmpwa62BTRqgRQbMWuw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAH2e8h4Vp9fJYAUUbOmoHSKB25wakPBvmpwa62BTRqgRQbMWuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: e5_dBm_cxddmKMF4p56IZejTqtolXgNv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NSBTYWx0ZWRfX6ad1x2fF3c3v
 /pFO5yxWN/OIeyhp0mdn+419wFAljbSjI0s2FwF5cEdcjuhU1yUya5LztPSvesRyAo0maX54RQZ
 NqIsxEAA5QCg/F2FrWOkMEeUVtGf0ef1kIBC0pOdjMBZW1XStxfsf8M8tf8KfhbdfVljmrhHC2/
 P62oJjc1EdVt82+rb+dd3UxfHZvdbO5iw/fjETw2I3vjU0qdwNeDYgiwJoK/VScVsyS1F0F4ggm
 etctCALhSG4DPCb/VVzU8lXHGbukYcPionIjfZ7Aa7cdqT0giHSCnjywLztnHxs8/1CCqO5bqZ8
 QeGe9p+0pbsDvrGYj1AnxrucQhrkFA8q+1hw0Yn7iZLZvyICO+k98V/TN5mpCjjz7NdZUAz+aUh
 eJSKsBJz+vDbFclkIijrpPstSgDY1G/HhSapI24gcoH7x5jWyG/vEiIAmsFNDGQ81ECq63aVK4q
 WaLKtevv3F1glmYY75w==
X-Proofpoint-GUID: e5_dBm_cxddmKMF4p56IZejTqtolXgNv
X-Authority-Analysis: v=2.4 cv=GoNPO01C c=1 sm=1 tr=0 ts=69b3fce1 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=A4iZcLwekUeCbZ0gfxgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130095

On 3/12/26 7:40 AM, Pengyu Luo wrote:
> On Tue, Mar 10, 2026 at 9:32 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 3/9/26 11:27 AM, Pengyu Luo wrote:
>>> On Thu, Mar 5, 2026 6:40 PM Taniya Das <taniya.das@oss.qualcomm.com> wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
>>>> is simply a separate block housing the GX GDSC) nodes, required to
>>>> power up the graphics-related hardware.
>>>>
>>>> Make use of it by enabling the associated IOMMU as well. The GPU itself
>>>> needs some more work and will be enabled later.
>>>>
>>>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>>> ---
>>>>
>>>
>>> Hi Taniya and Konrad, GX GDSC stuck at 'on' on my device
>>> the raw register values are
>>>
>>> 0x3d68024: 0x00000000
>>> 0x3d68028: 0x00000000
>>
>> These likely indicate that some clock or voltage rail is not accessible
>> at the very moment you're reading them back
>>
> 
> It seems to be harmless. In the downstream, they are always zero too.
> TB322FC:/ # devmem 0x3d68024
> 0x00000000
> TB322FC:/ # devmem 0x3d68028
> 0x00000000
> 
> In [1], the commit log mentioned
> The GX GDSC is modelled to aid the GMU in powering down the GPU in the
> event that the GPU crashes.
> 
>> GPU support for 8750 is not yet upstream (and A830 is somewhat different
>> vs the supported A840) - there may be something wrong in that sequence.
>>
> 
> Indeed. Chances are that I can't enable gpu. I must reboot again and again to
> match the sequence by luck, then I can enable it[2], and I must
> disable register protection.(I just noticed the hack from here[3])
> 
>> I heard it's in the works though, so you may be better off waiting a bit.
>>
> 
> Glad to hear that. I am looking forward to it.
> 
> Slightly off-topic, do you know if anyone is working on wcn786x/wcn7880,
> sm8750 QRD SKU2 V8 Power Grid uses this.

I don't know. You can try asking on ath12k@lists.infradead.org

Konrad
