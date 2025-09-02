Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E542E0922
	for <linux-clk@vger.kernel.org>; Tue,  2 Sep 2025 16:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756831335; cv=none; b=r8oEbJyZry+5w8Wr8HSEC5xxcHp2wp8Ce+9cxidZ51DKNUNznS1UEqorT5/dxT94ofNCGBA8GJMm43LsuTPNbxKko82K66Vw5rSxCnGqfvg6TX4uOFGccaiEUtJQESboZ8WrRZSaC93qJEHG4tko4MJD/3P4dVuiVVQUoQ+Yd7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756831335; c=relaxed/simple;
	bh=6JPyymmvsXLgSrpKkNJr7OiXZInk91jh/EV9/M7ovDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGoMhFICZry9aiHgjff22DmxmHibzMj/pEv6xy8ehibzhJ6VYVQyMaaYSEXL0hAFSRMq0YrO97WH/QCaYFRTIamZhZEiU4O1TVLS0RTycVmI+PmIzms+h8kSPcosFdBI9EX+8391DZDoueDcbTd4tsE5XIucOPR22UBlSKDzckg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=InSFRzib; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="InSFRzib"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqB35032204
	for <linux-clk@vger.kernel.org>; Tue, 2 Sep 2025 16:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R1Q8KiL2+HCUEDUShMWnnt0o3WQb0VxSpGfVw6mYrX8=; b=InSFRzibRwaNxWCD
	z/bsbdqrOwc/qzpCp0ZFEcgwePSsuq+PLnAdTUP8j91u2j+h8SouEkx0ziTF41LH
	Kn/rmJUGYCzyjdpgB8G9JZksY82Q0tkw+efOgBuKsMowB4s6buF91n3yqGFKgJgF
	WjDnptD3BZes84QXSkwiJPF4aAHW1l+gBl0ChnmL1ECDowViOFnkiEh2gMqXwQ9T
	IY+hI3PdE2vYT3jmF7RzArY24Ld5MWHgTPEH3ASGTGucJGlCwP4L4VzLsKJ7A7OX
	XZQPhRo7ljWEKH84grIA8FLHj8MNhIZibNc19nOzJEwcZl0GMYML2meiA8cYx66U
	m7if2A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8rhrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 16:42:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-329ee69e7deso717171a91.3
        for <linux-clk@vger.kernel.org>; Tue, 02 Sep 2025 09:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756831331; x=1757436131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R1Q8KiL2+HCUEDUShMWnnt0o3WQb0VxSpGfVw6mYrX8=;
        b=s3vQxJslgASn4xOmho62ltW7Jp7yHSNd8QcTsli9YUiUxCArnoT70QXbO/bKCLCpAa
         f68EEGFnrKlDTKwssQMQekvFr/ppidYxtJ/9F3RBx417C6RtfReabkODR2R7CMEuddxU
         DCy3F7OH9M+bOtbG5qEbYoiu2eXU1eAGbA3b9eYsp5LJCG1gPJ3tHBO62jG+IyP3rSJe
         kAnvthEmfQ9pzxV5SrNrZsYqind74zPiO46T0caW8NAP6a4Esk+9B24wMmOvEHvwqfrL
         DVZVwnJRBLxoP7XeLeFma8DROirUQa3g2xNyWO9KFQ0hUuvxVAT6hnBqgFToQXl3H/yx
         zGtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyHpHRIMqQbZVA57gXxdRFvkO4eai5a1B+K/Yo04hge74kuEk4edVXwRlqgfJNPO6RpOj8qzG2qQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjsULQSX7AKwPN61mLJ0sCaZF6xhK7EYHjW8nymMfSqvDP29kd
	bERSdh6z2X6hCREiHub3WowiHQMdtmVDBMu94HUOek4eT36IpCTdjoCUDyrzMHMVKg+LECsUwhh
	gTXI97tX+iZLXnAT5lAZVA9eJ62UiprZF+8Vpt5kXwYSfwXAg//eOipDTPQ38Ewg=
X-Gm-Gg: ASbGncsSWaa0W5uJQYZ5xelCtCgREXuDEVO5evafUQ3CKnoImyEb4YgtZiFWLviRsa6
	vSKoTVJiIucAJD5OCVceib09OSwPxSVcuAaP2gBaHXc+5OLwt5JKG6iio/5ePXPO4hyrduOzAEf
	TiF6562Jk0PJ4jMr2qPuPMZTUsZkfVolqw0FLLLXXd7vUxAGpW3DzbW6lAfH36uhj2fmEa7poFo
	SqkPL5rQ47U5GYS9dtRbfplPKB3lfDXclK95tZZR6/g7t56W59KREOH1/3VXYV7JojEmBTpDk6a
	yyh1PprOsnOBZakiltzOqgwaujxoppL9XSvILx6SXL/RWunQgCmKecu5BFG4p+IpNhnte9I=
X-Received: by 2002:a17:90b:28cf:b0:327:b66e:a86c with SMTP id 98e67ed59e1d1-32815412c52mr16856266a91.2.1756831331234;
        Tue, 02 Sep 2025 09:42:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrTc8edUsC7Q5G+n6pAISt7v2+ZY8Z1MUO2XiPRAk1RhFTTNaTZFdRS7z00ZYwIpbd5J4QOw==
X-Received: by 2002:a17:90b:28cf:b0:327:b66e:a86c with SMTP id 98e67ed59e1d1-32815412c52mr16856239a91.2.1756831330711;
        Tue, 02 Sep 2025 09:42:10 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327daeeca1csm14607210a91.25.2025.09.02.09.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 09:42:10 -0700 (PDT)
Message-ID: <c6bfd2d4-ac4d-4d51-8ee6-b1cc4e1996bd@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 22:11:48 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Select the intended config in QCS_DISPCC_615
To: Lukas Bulwahn <lbulwahn@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20250902121754.277452-1-lukas.bulwahn@redhat.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250902121754.277452-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ufrnxpm1b1HwFua_ltMdZrnI2TJyDGC_
X-Proofpoint-GUID: Ufrnxpm1b1HwFua_ltMdZrnI2TJyDGC_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX9BaARNOvEaP+
 OQYqh3IRPb/MKL+/fZKHMKjZTTdd5uonaYtycyAmbZo7fbuIdDPdNR4SU1GC06kGWFiJH41Gsof
 sYzyE1CPBD4LGz6V0cMX8tIWIFoScp58fh64LJSvFwdhCTOCX+wQxbqGwmyXZ+/mM9LJ26BwZRa
 RAcWOc0l7FXNJeGt3Ai5wD7TSdKrLJ373iN9bsFI5Cutbmdz7d347Ec7cgQ7kNmpY6tEaLz1ICj
 frl7NhdyIIrzPOTwzc3LuYP4PU6rwdV2m4nfCw3pUMIB4h7ClrlR88N/TQpHEd1SjTbuRuK6OlV
 nH17C2HaikY1l74iBApULkZZhjZ3sg54REnhNxcUzWExeN7o8pDUb2bZz5JSJFEl+42xjbTAgjq
 DusX4Nrt
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b71e64 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=+KjSowhBs1waSO1ngDLaHg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=GxmfVdM8WKu4Uw088-MA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1011 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020



On 9/2/2025 5:47 PM, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock
> controller driver") adds the config QCS_DISPCC_615, which selects the
> non-existing config QCM_GCC_615. Probably, this is just a three-letter
> abbreviation mix-up here, though. There is a config named QCS_GCC_615,
> and the related config QCS_CAMCC_615 selects that config.
> 
> Fix the typo and use the intended config name in the select command.
> 
> Fixes: 9b47105f5434 ("clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  drivers/clk/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
