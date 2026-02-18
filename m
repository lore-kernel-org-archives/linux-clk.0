Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A956312815
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771417715; cv=none; b=J6rptn8ExQ+gIOmK77KlfSDbZyIR+EYrI9iW32UHH7E4IM/89l7MSnidbdc+SS4Z6rgnnT4NO2lqFH+N84lSgu709wsD+x54+tder8dU2OUd9r7qecsn3UrANQSMvE5oeQ/euyFH1c6HR2kKdigdLZYIKJqKBcNzlT4RfmmGQDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771417715; c=relaxed/simple;
	bh=IW3tgHFdNPEDn4ewTDvg+EHXks6YVgmvk2lqEz1Jxkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0ZLf66LJ++MejKLuNclX2y/Fp+m4XV6+3sdReltwPlQ3wHFcVs1/QRK8m1EpOr3ZlYm6GTF13+c2UW47Tkn2d+pSSqAFcQMXinAcxSxn0mwf60RCn9xzhcZwUQUOK7q+8t2x6Ev18zG8nKW3UmkStPNR+MtTSayV1KF2Uwiek8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNJrrDKO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QUhXbFMp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNJrrDKO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QUhXbFMp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I5JtqF421067
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 12:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3ZPBBtbvqvgGENWsgdOYMO/o
	nnYa7qGNcfuZxsBQ0I4=; b=NNJrrDKOEhq4sA32IsRLg0CTFeNLS/Q2erFM/Vul
	2xhNoJECAVRppAR+oOE75QBbxdrPXWtGUe2BOS/Q2nyeGbJ28hQlRUcGdtzAuktx
	ffWyxQ3f9tErOcJtJ1IpatSg212pz27qCzArwB6C2uL5mNk2ZvuB8bDzwNpkzAfy
	0/7nfBLAna4KBv6bDntXZqCWRnf6UzjRDNWsG45/iE+FBYMBWxnEx0VEfzr+yi5f
	u2sog9Ttf9Ae0q3YiZT/MzHYF9tcfPCQCQPpWVpy6/vEvzK4LEJ/zyqCtw2yheUW
	9ay4FzDrMrq01lt+ZnkpnJWGHacXwQyYQTX6qTQNPv5kEw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd76e10g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 12:28:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ef98116so3762302485a.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 04:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771417712; x=1772022512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZPBBtbvqvgGENWsgdOYMO/onnYa7qGNcfuZxsBQ0I4=;
        b=QUhXbFMpvNdCxdMImomdLXEObnnwuV5k02rKfurpuMA4399qnBfr/05Sm5i0bzKNvU
         CzMyC8N7qj5dgRTrYCEMUMJf/GUqrsRcUYdoUwkwxPoZHDtEs+ngi8NPF6P1wyLoTPWg
         oHNNNwnInqY7fUf4udULwDdGDYLBDtO3sboZUG9ovjJ3LySqW8lvnSjvXQzGX3mUFhSI
         MTu8Im3yZUlkqDwDPw9eKGH0NWzG85XbvQ6Z9B2JDBjwXSOsfCUItjA8mv83WzSHVBqL
         ulxvwf8af/aM/tPMEkgUju4uwHGSzym3yvaIV/1TvxduuB6oU6cZPYSivtVOKmHHkRsG
         KwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771417712; x=1772022512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ZPBBtbvqvgGENWsgdOYMO/onnYa7qGNcfuZxsBQ0I4=;
        b=D61rOIwq99yXnR193l0FdbSgTpltbJX2rc+mRzfT4oRpX+ek2GrnsMx3Lq9HtmgOBa
         BkuQflI6h2oH2JqfmDq7Sg/2hsDLfMnM5GPOhF5pJTLhIvBmdwEDUB22yrpawxBr2Nz8
         jdnsMXEaXB+C2yxbxRRLDpTx02GEM3HPlbSC8docVg47KTeBk338Nw1bA/xCJV6HOgXf
         ACsCKM0DrXOrfCeJx16LQ4PWIHwpnL0WYO5sdilcNaZC3HXRxpjSH+R8TmDfBJQoiQQn
         +zzP72cZx+zZ7kZyJKDsux2TFPRmkuHpNuUR/5DIYg1WGbGc7dVW1E1+/hlpayhUeZC6
         hZsA==
X-Forwarded-Encrypted: i=1; AJvYcCXPN5V7EXfw5SiUMpGp9AiYckWFZjAvHC96KHVxKvE89GVwQGyZH2kANWo+OBz3xpBZwzjnuf03SV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOIyypn/8SaTXOqKPr/2eA9bVtF9tBy5kmjISwG9MbmkNdDwSi
	nsIJN1qP1LTlbbhz2lm0aNYbuyyBJzxCwlqz7aeRIyCANdUXROGX1b5B5Sg5iMGaeb7GLBKf9c4
	JUGVMnEm6mmRaNOlGJDGeRQnInkEeZMN1NA7H69/E2Pdz87KxM/2dA9KOkQ1tXrA=
X-Gm-Gg: AZuq6aJPcJAPqkZh5RmUMx2FM05j6k+pRnAIETVm7TJD7ix7m1r4/pcg5LrWMFA41p8
	D3Od78X/y0n41ABIM/kMtSJOiRyBlDQpiUWyCWHQHfs/CxqlFwMpu9bfB1Z5EB3FD7QVnNZ/F5+
	Hn+kE+c1v4Pt2LYVmJJLt8XFv7HYl5fOF+nNkrxUwFskFqG16K3cpAR4ZUQnUZ24TzSTYcLl/6D
	6tabQ3egrrFLHyhSsk5zzzOhjcR0IjAU5D5NLwBpTnZLnPeR2e1pGF/vR+z7gbPAwWLj4ndkgTg
	dKA/1W+m/dTZBRRb7tkIfsvWNfl9fOQrkSoBtZPeonop7avZlT39f0tyEROpkUt2sAQYpiUcsWh
	0akGRkwPjbBj5JenP27k3wVytkIbTih33CZom3c0kUVzfZ8WyAu1U1WABAdWQhK71tuGJ2PjPKE
	LB4RKBXi3KD6iDLC40jgELUORA7m1X+x8x1Fk=
X-Received: by 2002:a05:620a:1708:b0:8c5:2ce6:db1 with SMTP id af79cd13be357-8cb7402acf3mr174710185a.3.1771417712320;
        Wed, 18 Feb 2026 04:28:32 -0800 (PST)
X-Received: by 2002:a05:620a:1708:b0:8c5:2ce6:db1 with SMTP id af79cd13be357-8cb7402acf3mr174706785a.3.1771417711842;
        Wed, 18 Feb 2026 04:28:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5a513dsm4501269e87.54.2026.02.18.04.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 04:28:31 -0800 (PST)
Date: Wed, 18 Feb 2026 14:28:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom,rpmcc: add msm8960
 compatible
Message-ID: <tc5ropje7jyir7l3xsil7pt24utvbq56mlsh2l47tds63gxkf5@ntgqyrfxbzed>
References: <20260218-msm8960-sps-rpm-bindings-v1-0-bbc11c0d4f24@smankusors.com>
 <20260218-msm8960-sps-rpm-bindings-v1-1-bbc11c0d4f24@smankusors.com>
 <7gdpb64yu4ydcgfejfavq4g6vc3rz7cn3h7shle7gx6upscpki@podywah6acxh>
 <f1948d10-2327-45a6-9634-cd9ec01419a3@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1948d10-2327-45a6-9634-cd9ec01419a3@smankusors.com>
X-Authority-Analysis: v=2.4 cv=OKsqHCaB c=1 sm=1 tr=0 ts=6995b071 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=eujWdvE7CETSofOd-fMA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEwOSBTYWx0ZWRfX3zwc19LO0jvU
 ztl6J6lWg6jRF6fBA+Pw4bX/ZCin7z+ApxhdvJ115JWpDYxSuRXpbfHPW4oK0BnrUETV9yrRz+8
 TJr0TMZdQvou354CCnzZe+PZoHt9lLvaMwnrWtZDbzY6XGzRRW/tDAGFv6zDz5cIY0ys3hMn5QX
 bVBj+uKo34u7nNF2yautmjfxObVBtPqooijwvlLRMeLZWmBGY+sfsvEnNmZ3Ln+ZNgGJBdzjjBE
 zOnt1USCt256j4Tq0MpAPB3GUkwdbwGObK8DJrmQ0moaIwjpsIpNQAHZyvFFLJIzmhGms4wme5a
 klbNkmeAKsVYPCuEVN/FGI8Po1cZcvhZwuADf6wYF0XE1728qmE94jY/Sb9rxOYkSCdXGSbTZ6s
 GageuNpbUBt7rAhLLS0TlCVEooLXICuqqnYQk3IzfvdEDXGJhubn2QxJT2Ypa57YxgvVI5yikH9
 lyQ3NaX0WWcorDQg2vQ==
X-Proofpoint-GUID: yJ4tJzaKKm0y1hTTJaEOWs2dObhXppOi
X-Proofpoint-ORIG-GUID: yJ4tJzaKKm0y1hTTJaEOWs2dObhXppOi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180109

On Wed, Feb 18, 2026 at 12:12:02PM +0000, Antony Kurniawan Soemardi wrote:
> On 2/18/2026 3:44 PM, Dmitry Baryshkov wrote:
> > On Wed, Feb 18, 2026 at 06:59:05AM +0000, Antony Kurniawan Soemardi wrote:
> > > Document the qcom,rpmcc-msm8960 compatible.
> > > 
> > > The MSM8960 platform shares the same RPM clock definitions as
> > > APQ8064, so extend the existing conditional schema to treat
> > > qcom,rpmcc-msm8960 the same as qcom,rpmcc-apq8064.
> > The way you implemented it, it requires driver changes which were not
> > included in this PR.
> Oh wait sorry, I was misremembering thing about how I should sent
> dt-binding patches. I'm planning to send the following patches:
> 
> dt-bindings: clock: qcom,rpmcc: add msm8960 compatible
> dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic
> mfd: qcom_rpm: add msm8960 QDSS clock resource
> clk: qcom: clk-rpm: add msm8960 compatible
> ARM: dts: qcom: msm8960: add rpm clock controller node
> ARM: dts: qcom: msm8960: add scm node
> ARM: dts: qcom: msm8960: add smem & hwmutex nodes
> ARM: dts: qcom: msm8960: add smsm & sps nodes
> ARM: dts: qcom: msm8960: add riva nodes
> ARM: dts: qcom: msm8960: huashan: add riva node
> 
> I'm concerned that this might be too large? Or not?

perfectly fine

> 
> Would it be better to submit them as a single patch series to enable
> Bluetooth and Wi-Fi on msm8960?
> 
> also +Krzysztof for the same comment.
> 
> Thanks,
> Antony K. S.

-- 
With best wishes
Dmitry
