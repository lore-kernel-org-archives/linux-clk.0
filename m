Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA5140E8E3
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221819; cv=none; b=ZOcU7JH9LXUPozQy7MX1qhM0SgG5tmV+39bccpt9AuU51UIQ8vqThh6w1eSjI/DJfnkiEELtZ4geK5YOwFbnmVzuzVdtDro7+zdI8naDGGqx8fVi8AY51nrHqubF9ZTljrcCiHx7ITeyL40JEImtBtJFhPD+8eEXKAYqLgM3GxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221819; c=relaxed/simple;
	bh=PWLPimOLxeJKoV3EcFGwk368jnyiHugBx5veMASyBH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTtfQ+Wghz9vwvbglzJgmt2gw/KNLdxsEEUUbfNM3LlqLHtxO2riuibUhMqb7+VpGeFMeU0/LwNaHrTX/1RffMA6qIjDsNSSYsp9RZFxGNGUY1q46RXzW/5Fc3yjkbxauzjjBJt0vkGzIv8nVRZAhAbQw6qUkCdzw1bXKYVQDi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nydox8Tn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kdSAG8ok; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nydox8Tn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kdSAG8ok"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA3FxA3454831
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLHMlJ0zXtr18TvUn1mc/o+7ROZpENj+V6CPrImGZoM=; b=Nydox8Tnvj4bTLwQ
	d3XtbcWlzS38o93yWF0Ifa7IzXRMOM1w/EYlbwRB9edW2QZh9zNePaFVVqy1r/89
	R+Ue9xjLLpg9pM8MGO9YTDYgx7ylSkWAkD4KUrBZQ2rLgIgS2AwV8+v2mfs9I6zh
	OgdzI5B8902BiPN8QgapWj+CiJdhNUR7IzpOSlQshNorK8Tn7e+s2mPE5ytOFAHc
	0Z35R1cNY3mmJWCKhMeq8MsdZs6vR7HwaIvBrtVnRI2aXt1z0LAki5HGHUGTDjRr
	203qdZV7NjaeA/ydYxgTdHiPdRmk6ulP5sIFUsNWBeqla4hggTbdWilwu1INy2du
	vWsDJg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg883kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 10:30:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1e777a15so3380681cf.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Aug 2026 03:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221817; x=1787826617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLHMlJ0zXtr18TvUn1mc/o+7ROZpENj+V6CPrImGZoM=;
        b=kdSAG8okmQc+FcQdSDO7aeyXnABw/U1rwjKza7BtELYo+nxBbGIsUcWHuOFTk7ysBD
         e5vE2SzU250iZvAxd9f53UbqKHNRbiI0eijHok/wpfQvcBudrfI9AV0aUFGjCR/0jD3t
         oi4IjKGyktL87lPMzufbz9eFnz0lBRDwrSmU9tc9yzzV/eGIWZCGSbf/cmyxCkKKIH5w
         XV2mA2xAeM1mnEv+NZA2AF1ttqHPU8Og1s1pNsT3iD8s22DXF/+o2r04PHw9hehu7reP
         a9ndiLiQf8J9pt5td7cTdKCfltdNkHj7W9F+6TU9LRuzTOEjkcrmHtoUgSDpzGynw3Fh
         8IDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221817; x=1787826617;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLHMlJ0zXtr18TvUn1mc/o+7ROZpENj+V6CPrImGZoM=;
        b=Dx3WTO1HG6zAGlyQytVC+AHkZijvNd4tSgIAuDLzmwXxpbglwFuySpbk1TnHESxUO1
         R6I7jZLXFnfFMQ6ufu/fQQ5hKAOekrygfWJNt/yfjtdIU/SiLX22is/HxrEKc6y0pwa+
         +Dp7G4V5gUyVo9LZluHKtKlGnX/WIeIzB7H9Etpw+oAMDcgzFhTZNmzzbyI1Qq95yJ5j
         vFXXFaiGzP+J3aLVOKaSjSiephDjLtReYiu3csXSKjo1LjV0/FQpgJCyz6S0UWlpKHyw
         0AqL0pwl0aa/QDIycwBR1cHzAYMl+qHswm25gasCHsX+l+mzp2x0L1p+gEo8PQGHXFho
         bqKg==
X-Forwarded-Encrypted: i=1; AHgh+RozZF/Qu2Na1T4V0+ur2VCwfo2DVhvmfo3iipynkUNFjIFysMmz0qGAO4Q7FG1VMCXL3xVmv/Y4o4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzVQM8aGNJGyxUNisVN4gnqiRkiefw71CnqrJ29ikCbDMy5YTg
	t7pp5GLhJ0YUaXH58BwNiPAScw/NUMykJ0mbrbbf/cZdzPg0NdlsOqgqrkRXavOiWAZc8XtaxE9
	oi8AF3glR976aWMza6XF2GGShqQDn75lA7t98GwvZlhKAjLFDanr+gIYTxmh2ZA4=
X-Gm-Gg: AR+sD137IGItWdCYaMgpbTYKyJXHY2AzIeJdT4yw5MHJdJLvtDhvBht8ihIzVXNneC+
	/rSX4CrNNXWqeB1FpUFr+W30nq7nHaFaSY1yJv8e6ySycCAXsCOlQabMIr6lmUBpM8cF39ZczkP
	F0Z/s7rAnLB81QMZ370LuNIe12F1FoUBrqp1RJp5chZNr55o89S9LQURT0QbEvVukhKbLDsGLuo
	e+1bZB8SAjfXkwrbLQisYlL4I+ghFKGlyP+Zx6eQ8WV9FwR6PsWuMjp21cFvAGQni/BNIMeD5H9
	U32n62alCTz04B3McNsOwHxiHrPw4/3XlTt+qVapkDTvcLqqp5s3slsACey3K2bZPlex1bbyGIC
	cMSy6a1FlAXzEOf2W4aSKDzTr
X-Received: by 2002:a05:622a:491:b0:517:5d21:9899 with SMTP id d75a77b69052e-52dd61c060cmr87004351cf.5.1787221816727;
        Thu, 20 Aug 2026 03:30:16 -0700 (PDT)
X-Received: by 2002:a05:622a:491:b0:517:5d21:9899 with SMTP id d75a77b69052e-52dd61c060cmr87003601cf.5.1787221816079;
        Thu, 20 Aug 2026 03:30:16 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b0b00esm52770466b.23.2026.08.20.03.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:30:15 -0700 (PDT)
Message-ID: <1134bbca-9c3b-4e07-975c-21aa5c49fac8@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:30:11 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] clk: qcom: gcc-kaanapali: Tie the CX power
 domain to controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-7-e67ea30d8b7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-7-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX/S1bZscAn/vI
 kmwmLu31OlP6z/yqmKCtN2z8dGACC0G2ESTmGuYwi0/25tWZaQvm4H4027tcH3P6E1KdjC1p+vy
 PhBhKH7MTxy1bg3d5o7On70rZhR+6Fk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX9tlxxGvDIxGx
 D3ivtT0X+F+WKpNHnLjcq4uNnzV21RcjLoA/N5SO+mwNwHa4H3HvfMWA2dbKqIZB7Auiyy5yGe+
 1+e4OE3FTCgO64N8calS7ZzVIGKFPkB3iDKcTPsbR1Y0jRaIo0d6imfV7r0WK+6jzL1LYn4Dr0Y
 8+OEbA/Zlx803bI215C3u+y+OXpHIapdj3tNaONdf1RxINGzqoEFj7HYzKliujS8oFvsatG91Vd
 cMqAKu4fqPRgwlbWD/lxnwRGN/Tsc8roA3YK6qrSwDQeYaPG3N4xi2X4nWtn5eK9QEyxBbKXrig
 5TdKD47UTmeOrb0O2UPThsnI6l/ONrWY1CgVE3hegfAJVDW36L6/nxmxQqPAbfbfCDXHXzhh9gg
 GlOaGxffFC1BKtCtxyM9k73TH29iFmNg0l0zGdprA79kDpHC9c38clyrIEBNwrn/pvnkCjCqFMO
 KbVhqdZ+xz/xce0nm1w==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a86d739 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=tWEGOuoi_ilLz9bYf_QA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: gAXqGOGMaUY6iCW6TnUgVFnAvXy2z_9E
X-Proofpoint-ORIG-GUID: gAXqGOGMaUY6iCW6TnUgVFnAvXy2z_9E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200077

On 8/20/26 12:07 PM, Abel Vesa wrote:
> Enable runtime PM for the controller, allowing CX to be powered down
> once all GCC consumers have released their clocks and GDSCs.
> 
> Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
