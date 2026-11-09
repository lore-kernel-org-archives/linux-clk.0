Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214265;
	b=sBpIrnJPKuHbipvMtpk7QcqwebbItiKZBT+hjDboa53FFOyZEE2xSsHgcJwZ0nmGa+Xc
	 OuqX7TG/Wu/vtcnNTbv1nDc6VfciD70BVUYtGNTr3m6V+6JopCfXBIEDiHDuk+YGUHbxU
	 wf2Hj1UuKdAifuA0X4vS8HuTofofE7uwW8dQb2hxdZBh4zEL/Iwqi27JqwLcNYj3xB8uw
	 WUH6Nf/VzCZ+y6NH6HSAeDTSC2p9OhKdbi5f3PpNUntqm3TvjwO2jnamNreZjZtAGFm/z
	 /Itk0DbNCjQKcoL0YhSYiHb77W2NYm8VvYU/UlWmqKBvcykxqHl/ZfLSVM6/psfYNQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/3oARxDEXLg7TaIeiQ6V/+h8xlKkrQx7Ze0qvtDuS0o=;
	b=bix//hVyR6EGZZDVbAGE9P+LqJ99dFaYRvdD/nm08gaAhAtBW0L3N+jlOU0dJ47Vz+7J
	 2m1hGy7qWHSQcqQn1oeSLXHrprKQGDBQtpQsrNUGZvZuNGgRqwMk6YfoxOl9hwFAB2m/e
	 rPegcUBkTDIqojyEryLyY26Mjh1WA7uWqiXMQZ6zpJl8ibjvek99bElUMdxA+KhIaUj7g
	 kv7uR/se3IUTqzUNXnKNUpmOFIqybX597NYjUZBee9zKfO/9a2hWMn7Jgiz+dsI5m8UL4
	 0iRh4+hV/RrIFtuHUhMzB6ERGiAD60bzje/9NCQ1CBENGu14MzXPEGf6Qg70wqoMuZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cjrSw68y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UP7EsUHX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F523606A31C
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 08:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F523606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cjrSw68y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UP7EsUHX
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969vPp401457
	for <linux-clk@vger.kernel.org>; Mon, 9 Nov 2026 08:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/3oARxDEXLg7TaIeiQ6V/+h8xlKkrQx7Ze0qvtDuS0o=; b=cjrSw68yVIWyLr/e
	xwi4uJeVc9sKtHO2Xr1mYmIH7z5SlQE7UxfRuNJs9f9tvHYNZ1YItIbo/mB/V3+Y
	r1Ztf36xojPxSquwT5XIpkJzpVL+7W5IguF1hckFJtVxPYWG82pSA2Nq/q4on1cK
	5wwkarHShHogSjHBittWPna3/BMZt49ns3QHBpYNixfjFm5u6u1FXt6XezwDRXsg
	ptskg9C5EwJSFo9bCpTTYXt1Jmjbvnhgf9YECn96QMFuX7JFmJ8GKdZY1NQYPW3u
	bz+lu+ZJaalA8mHfH3r6h0BknwNXeRZRIsuLr9o1CO+Ue4O9wDXOvc1IGo2W4XA3
	U9iXkg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf5u89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 08:51:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36fe0b57d91so784010eec.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 00:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214264; x=1794819064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3oARxDEXLg7TaIeiQ6V/+h8xlKkrQx7Ze0qvtDuS0o=;
        b=UP7EsUHXjxAcRBKAOoYsVd+lU1C8nKSBhoGcKyHouS6aedfgJyQ9vEAFNRDag64F+p
         WjdfHa8yd/sH2luNCUiMI6sNI1nlyHURl4nAUlXVcZYz6FsDybgoj+ur9CcmoWqOkKSm
         ykPNUSs1oedb3gttjjxNIaXpLb6QJRFzjIBccr1gXE2w63q7r3/M90mf1vbna8Sqv1ih
         GYIMJoWcoY7n9tPHc17nauv8brGEJTM/K/DkZLqr2DNyWU6++20IjoN1APRM4aGLTm4b
         R4SRy50Rx6Cq0KkA8O1IC4wOtSzhWG2qRWJmSS91L6IjcWFn7iUeaAdPQHqFo5wxypPB
         ao0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214264; x=1794819064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3oARxDEXLg7TaIeiQ6V/+h8xlKkrQx7Ze0qvtDuS0o=;
        b=nhSJmWuIYxMvVHI7f4s1m64Owg02TIcKHRVj76/2T6jN3pwSAOOi2jC/aKBL97oH1L
         M5/+X9v/1itytEWfswnQSDfm2uodWkS3uLZxk8wvwnj18dp26EHebXkw0jkSd15UGOc/
         Ddk2oHs+aPIJ+TVq38mzvly/tTer5vjXen8eoClFp7OePTAb8Y3eM2uKEdts7OP4/0aG
         rb2mrvwQW41pg50DaCYlQQHTwX8OOs9TkiMX5PNZ8W7WfJbnWXsifo6mQhp4+P0IVvvr
         pgBuF4NqJx3RquV2D7d5JGDPcLoAiGmm3DyIyE+rFdPUAtigKgJ9YqIpFffPV+ypR+9I
         1KcA==
X-Forwarded-Encrypted: i=1; AL+hErG0Mg35n5zNMib6hPbwmuV3I3UoWgm1UqaOHduulz1fh+ZlwzxRJ/9Tbdm3wJ+2tELERhj8JXkRHio=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tQWdczDWaghHnKq8hqjWspTVdrFG8lnM5D7w0V023NN4naXci
	QbdWuQK8vY2o+lJ+so/8STPMoTsjpah9Fpo2/3THxpXyKnC3NsOE1PqfG3c9sqH+Z4wXaMbmm1L
	6BoT23ce+f1/PCfY8tccjuzkNMOka2VhudnCz6QlVx3u/E2eqlPsC8z3FKbU/lXs=
X-Gm-Gg: AYBFou0CrQWajzHSf7stbGc8faW5ABRsu4V3qezFXHOPdLJgjvzpieL2ZTqGqhCEh91
	xXiZp0AFbI8LT2015qEJ52yi7vhV5fgiYap6WD2GsRqeNSpORaXO8l/w0kdTcN5etgB/RlhtFX0
	EPF2oF1a4BVWKTuPoruJxzEZBzBHIvJMQSbWStkv0/H9v8b1i9/+4DrUyhLVLVljdh5o1+u6zqR
	7t8A5xLKXQ9dc7H35VTyibePUxvLEsa+5RcihESyYF1auxJb/F4jrdixTixT0yhJr8c1N6tLYPd
	WlLlhy3ByRKcRVayMyKlxyy5oa11lMo97I6Hfvh8BZemOGnW6ZzZHXQHA5UmEIDnSuBtH6cv9cy
	Xxbmz5iHK3i5ivAFmBLIB46CvEppNJhsSTQTPW7yv2x/lTTdaR72hbbyeECMqSrseEZa5IJXUCj
	WD
X-Received: by 2002:a05:693c:87c7:20b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37256614e85mr6020741eec.11.1794214263795;
        Mon, 09 Nov 2026 00:51:03 -0800 (PST)
X-Received: by 2002:a05:693c:87c7:20b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37256614e85mr6020716eec.11.1794214263258;
        Mon, 09 Nov 2026 00:51:03 -0800 (PST)
Received: from [192.168.0.195] ([124.123.199.27])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372656187f8sm10575336eec.5.2026.11.09.00.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:51:02 -0800 (PST)
Message-ID: <a7228569-c78c-4262-a9ba-d355101a48d0@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:20:50 +0530
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
 <20261027-inescapable-rough-viper-6cd56d@quoll>
 <fc2c4943-0482-4c72-b713-5a66c9995c5e@oss.qualcomm.com>
 <362884cb-71c1-4d12-b315-9923118c8564@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <362884cb-71c1-4d12-b315-9923118c8564@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX8JjIhtD9YUh1
 nCDz0wTDSFq8KY1PGBbolP/3mhaXnyt0zYIWqiSFYXmnNatrbPAXSZMfFss/E0ss20mkrNYUNtK
 c5Xg1+v4yFN2WmtbiJYIdjNi86VbDTQ=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af18978 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=kgg5nJQTCQF2KXP9n8GJFg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=IYge48onPvb9mXducVgA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 2mNv9aVTQI-N59S2g3blx0BMMmQq2mwU
X-Proofpoint-ORIG-GUID: 2mNv9aVTQI-N59S2g3blx0BMMmQq2mwU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfXzVR4ziMxSY/f
 WvTfUxs1pSw+U/einw92cOxhSve59y8YOEYgGmRcymKMIYHIcbsnyrokE+4JF36M50Q5vqNckvh
 9bgL/WAMjEs0PkWxNdgzsZ95IPE9c7fIw5s2dBRyt/eMdEgHYk6CWjoR1aRTXa1vpNdV3sGZuVg
 9BXX4gZRnMcLVUTnJf3HespotPPEVkaVqCrtOmcwRn6FbxP9uzju6K4MT8ZLlQOkEYphg13P/mK
 cLCc9+/xl/60CNnSR8t3/kGLTbQm4FKNAPv0RIwvTExCqfYEtFsfpLnJ0qlM5qB7wjGY6aYBKQh
 IJqvt/Q0Fcwgp+vhQatdPwSuGz3Jby6PJ1nt7ar3t8YHyJmmZxOTsc5n51IM4BR8MB1JVI7ryKa
 hdvixMofTc5p7UqBMtOwUI6oDErMDfZOUVvsYVaPyVPGfjOHimpO0zD6VHptMZvWpqAK7sP5np3
 9u1Ie901X0cnd/dJezw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090035



On 11/2/2026 8:38 PM, Konrad Dybcio wrote:
>>>> +  assigned-clocks:
>>>> +    maxItems: 1
>>>> +    description: Parent clock phandle used to set the input frequency.
>>>> +
>>>> +  assigned-clock-rates:
>>>> +    maxItems: 1
>>>> +    description: |
>>>> +      Rate for the parent clock in Hz.
>>>> +      Supported rates: 19200000, 9600000, 6400000, 4800000.
>>> Neither assigned-clocks nor assigned-clock-rates should be needed.
>>> Parent clock is outside of scope of this binding.
>>>
>> Sure I will remove, but the parent clock input is a requirement of the
>> Hardware and the output of this module entirely depends on the above
>> ranges of frequencies mentioned and that is the reason to keep the rates
>> specifically. I will capture it in the description and hope that should
>> be fine.
> So this is essentially xo, xo/2, xo/3, xo/4. The gcc_pdm_xo4_div_clk_src
> you added is defined as a 4-wide divider - do we need to limit that
> divider's range, or would div=0b1111=xo/15 also work?


Konrad, the divider is valid till 15(i.e 1.2MHz input frequency is
valid). I will update the frequency range in the next patchset in the
description if you think that is the way we should go about.

-- 
Thanks,
Taniya Das

