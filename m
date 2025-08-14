Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAED03101B3
	for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 17:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755194113; cv=none; b=UE6F5pggueUzo5r2T0uWU4KV0CX7zbV96rnsh/9z8zpNUjY8mvy7h5UovGLR/pat8YK05FU8c2z7VNHNlM38sl9VPBmHtFkMd/02CiD2nYCVF/6+YQp1HMxQ6sCC2y2wKLN1x02a72kq/zkLnm/lQ7j7PRu4khKuoJ0RnzJ/TTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755194113; c=relaxed/simple;
	bh=ORCr42UJalAW1unb7vVLUdGNfgegDf8AmnRiPFr+gZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tyyVK3QgYe2m/wjDfKI+48qFVdAcY16MKPXucOYCo2piTiKVfxRkNil8s55JyM4NenahgCg7l23qZDrPPZ5f+QZVHL8YVROgsJMGRCvtpjAxknG0MmfrAw/J5FyY1skGJk3c/t4uwuco1oRG9Ty7zc1XZapLYOpMIXfb4OedXCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cvYMDrSp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cvYMDrSp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EHI4nU027429
	for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 17:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JZv3VRcqeZuhnmVMXAw6lrB7bSuJ+i+L/0SR4ZWbkJE=; b=cvYMDrSprDWLWbxp
	zaw5oMUMuGctihW/6VWy80KPDvx76RKWLbOaKudnoAZethxxV6FRe4H/3XnFqxVv
	nlNZ9uJnC9idUa02KXVNM4VLyK9RiFJVYaDIKBsKWH2mSl4MB1z791VetiZxrDh/
	n10Hl2sfMZJbbMNC2RKCqDKvbxYkIWJ7OkE/c0IpGeiE0eSWakvLIzTSojPXz8b5
	HUQXcBJzuGEuewQl3X1KD86aRqCDOr/04hckvzQcHRNnHFdzy367cXyXx3YL/3vL
	i7xdDIBFsyBjTU30jdvmwNcopub4ExOjdSONjgDd4+hp4sDIDS+lOFGWRXVtSe9A
	tyJ3Pw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjvhth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 17:55:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24457f54bb2so26502015ad.0
        for <linux-clk@vger.kernel.org>; Thu, 14 Aug 2025 10:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755194109; x=1755798909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZv3VRcqeZuhnmVMXAw6lrB7bSuJ+i+L/0SR4ZWbkJE=;
        b=YKzc/Gk8ImbMS13GZtcW/AFBiKghdIdgMeD+u5QnuxDlCMfS/Vf7EP3VuAfbFFMI9X
         sOtr4E1wjAIdUhTDWZRehGLYDX3Ony8zSwrBERj3k9tPueE5XIedT9U12/pfpV13DNRj
         /hyfpbVvK7XychOu6si6WABj2EarYYbzxb4p49qISaYXMwOP2YQtUtFOy8i8it6rRu0v
         D15sGz1UMeCeQwdxaddzDx/GPf7NRPLqW2w0orrkobRxObRVQBIW77tbsFrikfzEklJT
         OlGqjvp12WKtqI40UbJdhCOXAl+uSVCPpGyuEfv5+VuOaUblpx+FQPizH9o/h0NHuEZj
         8CMg==
X-Forwarded-Encrypted: i=1; AJvYcCXxZ68p1/C/apVUCrNPJ3rVNqWtxRIYvZawM3QnrVa2+AR7DKCHuKknFhtrpoLOjLVDX75SPQGXNAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrgYi23ExUuLoAeRh/owyA1DvjucfP+5yfy+7kTfPVK7XUw+Gu
	I4kIa7ZNg0fpWAiRlADxroFxQUsRMGwOu3Ng4vv8ZRpkRUFb5mDPNbkjJ3xyHdvTKzs/t3H5/qh
	Ai6v4PvQTC4gq4ueS1CwjpSWNbcCsMGcGiCyJzNt/DKBvLz7fViOLEDOOnGD2slQ=
X-Gm-Gg: ASbGncto2hJyn8VuvChfBs2IeFjicfWAtgj0PgDz+PPlzTKDYmbZDBh4d5OVIME5NYk
	FJzpzmDEBmLHKWvW8QDk9n3kUT2GXX1MiA9mWdQLwrxALW1EpCzRxgIDeuKXT870mhX0PhCnbhn
	DapDCI/cZFFazZvdzW/Db+LmnwdaS02zJty0qm1imqQi1l2yetdZcaAbdUTbcFBX53ErcGVS61P
	s14gUlisuY8Gn5c5mjn7E/8NpVTamtqcuWZcKvpW4Gz9LosChzIFCDEal37Xr9frXhxEoqWIvKf
	nIAIPpvVcEwbYnzzSVuXy3k4LfHxRv0rpn+w510AkqHgWgXrMb7LhMFNdr5I7+orhF7R
X-Received: by 2002:a17:902:e78e:b0:242:460e:4ab8 with SMTP id d9443c01a7336-244586dbc4dmr58394095ad.46.1755194109364;
        Thu, 14 Aug 2025 10:55:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7GjEYwKJ4eUG2s8iqD1mFqhdTADJ5UyumLsiIQwOIDf3LkbwscHxfBfaO3NFffYdyQqpu4g==
X-Received: by 2002:a17:902:e78e:b0:242:460e:4ab8 with SMTP id d9443c01a7336-244586dbc4dmr58393645ad.46.1755194108881;
        Thu, 14 Aug 2025 10:55:08 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.31.133])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bac0391sm29539707a12.37.2025.08.14.10.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 10:55:08 -0700 (PDT)
Message-ID: <9994318f-4c66-4400-a588-721e7832bcb1@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 23:25:03 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] dt-bindings: clock: qcom: Document the Glymur SoC
 TCSR Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
 <20250813-glymur-clock-controller-v4-v4-2-a408b390b22c@oss.qualcomm.com>
 <20250814-warping-hawk-of-brotherhood-0a34be@kuoka>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250814-warping-hawk-of-brotherhood-0a34be@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX1MWlQuy7Bk6F
 j8KKfxqy8C8jzFdP/W+1Khmr0Z+YdmBS5VjVtT7m1Ctl1yLSJmydlvniav/oHP7S0ykrPBLy1wX
 xc+twz4Kkt4tCZjlqqCodC6W9NxU/1qQfbiImHsK2gQwtKSVOWPbTFyF0Ro2my9/O2h1/bf0Hec
 DK5S12Tmht18GJ/wD4oxTnP6BmZC6mijWCwPQUi/2yHMF8AZ0477yEuTcRTlKYD/ElYLjeCvTEY
 ecRPhXGHM6GPXzJAEEcG26UUgF3KYy2xOlaztKf3QYwJ28/cUP4qQy86uYttL5sKUbhBJ8Qgi95
 l6Tj2CR2EDxC9Ep1L3kmYh946NNYnfJBNmlg2/uwtnog84B34Q+Dap0uhQumQ3NcSYv+vOGP23s
 awikTkgz
X-Proofpoint-GUID: H1OKIiHogIdnhWgFJ2UrlX6biDW71Od3
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689e22fe cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=/kiP2gCwObMqexHosDfpNA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=P-IC7800AAAA:8 a=rVg30yMsodvzwDQ_i0MA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: H1OKIiHogIdnhWgFJ2UrlX6biDW71Od3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074



On 8/14/2025 1:37 PM, Krzysztof Kozlowski wrote:
> On Wed, Aug 13, 2025 at 01:25:18PM +0530, Taniya Das wrote:
>> The Glymur SoC TCSR block provides CLKREF clocks for EDP, PCIe, and USB. Add
>> this to the TCSR clock controller binding together with identifiers for
>> the clocks.
> 
> If there is going to be resend:
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597


Sure will fix Krzysztof in the next patchset.

-- 
Thanks,
Taniya Das

