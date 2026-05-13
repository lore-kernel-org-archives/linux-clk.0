Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8605430677C
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681206; cv=none; b=MtIPn1rm/AQSWYaWUsbalyV27sqD5D3al184mWvWmdXpawmSZuaGsoGHNyEM9GMdYtLfsCNkRkjxnbS2HTPg1R12eYXyWfrCadcM1HnuBi2tCVYQKcpuCcUQkhvomq0uy6zAWUyAT8slwTwfgRWZpRa9mNgzAIi32aU0/G9mOhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681206; c=relaxed/simple;
	bh=Yhyz0hv3eV8PhN9nKafDEtA5JZ7bSJjwlgsphHBI9MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eho40mBrWjl6Z8UDQ6JSMaC3f9mCVoOX2kN7/wqC7oHxkCkOUv9W/lJZuroRcQpcnPpfgCaLSIUQpMTOYQ3BKzWcystRVb3SgJ2SYFigDowiBtwGm5zUy1uq6VpEROqN4EEBgKkoCGqTohghHI5dFgFu8JVmv5vB4E+L3Twt4Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nj6ZC+Nq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZWqjnQ9V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nj6ZC+Nq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZWqjnQ9V"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8mMhK3474958
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Sv2mS35ALbniobTUzrRKgd6h
	lYi7vNZsP9aMzxoPIfc=; b=Nj6ZC+NqmElLseaABuYVQb1PqleeNZjFLDTD9Kns
	NwjU+8opwm1i7EtVj6ZryMVbzNTxj1LiWqO3wMusTO5wONMQQ4ZWralPlex5Aztj
	BQoa3Zoh727EZGXlzICeBQ4wiDAgwrKPsVRYi7UsEyZ6VtPsmMf0wDV/4cyjQokz
	Wpns1223rrbTp91qP16RBOHNYiO7e5jk46ZzrbOZlB7u8p3QJEwOS3hpkou4XSv5
	JpwpRQJaj1FEdpbCK+qBityzgeA0XQ7F8jEIvs4dGgj7cl2NcKwkXyTmy6zAvDAf
	ETVj7ipZbKvJ+k0/hmLTCte4CfMG4bc6pqt4+qmn1TTR8g==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p419639-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:06:43 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e3a223b936so8448594a34.3
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 07:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778681203; x=1779286003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sv2mS35ALbniobTUzrRKgd6hlYi7vNZsP9aMzxoPIfc=;
        b=ZWqjnQ9VgLzbffJJMXmiBUaMApQo0BbUv/rb9B7BThAZrXZN3aEc23uAxW+Hd/j63k
         keYxLM7f3B8bfgZjQpQOHBTmA5koVXMLl3v5sLTHMJxHsdGqA0+2b4LXOBfw9X39w5g2
         4koo9mKGaEgW1qNHybBbRQmomCmcc2LZflARGAMgCpYj78eeGW1j9vGYG503cplwzKx1
         JU6RotkRMa3NUFLBN18ygC4Wz3n/DINd6xp1d+1ZjI8cIqg9KBPqma3jxbS7zvKXohI8
         2Nth+B/kQxLC/W9f+mTY7i2qC8m/SJ02nHgzg6ovFR72x7g2gZjI9M7Eyu1WhdIAyP48
         5flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778681203; x=1779286003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sv2mS35ALbniobTUzrRKgd6hlYi7vNZsP9aMzxoPIfc=;
        b=UqSWuwHnYeeJh4k4ok/vpCkbksuY+4Bjoge7czBfF7o1bSP9K0r+eQfRZqRs1rJKch
         gf8oUVMRYFRqiWG0tEkjTiKkfgfCAQQ+qA2WV7QEqiynb8hPC2SRHmtEx4Cu95io9ZCt
         KXxia3YDqdsHbrTlqu6g8Wnhu9miJoNnkcU1Pt5DgA7VuB6NoKfjewXAvc+v2UpPfCil
         3Xhx4l0iGEaFnuCjUe57G6S9oyYWMWOFsjoRvoag95ZNR1zVMkjI/xZDjzAVLft+Lkif
         13lcgHcMVjNEnlwqCYOBUG7lnCRvlKQinDvpvAo+2sNdu1vWmPwz+dSNwxzcd9Etgyy+
         uvxg==
X-Forwarded-Encrypted: i=1; AFNElJ/ql4xtb2xkl8T660TxIgMKrDWWImEdBXfkcvcGOFDGApItNSMqPaMBUrTQ9Xhy3bpyGACH4hx3Ik8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0SIKjINP3d5UulRfxeO8QVGgRuHQH26+Wq7WYYtkZ6pynJWqe
	KOdLWDI6tZt18KTW2M9rQ7jeM0RanLOk8w3iAUSf5UxcZbGEJt6EqQfP5ylvFLpAl+ZFRUrtHSt
	Hs8LVos7cEZDk6d6Zfy9zGwxio8Oj/jR1wrVa4Ophh5rV5p3m0MH0Q2NpsJMH0Ik=
X-Gm-Gg: Acq92OFClC/1XBpk/rFPx8j6hlQDI+K9DmllD2hIPnq1QFEErIT/M80b4iZZu8uLZxe
	UVD7htaqVayw1A+ECs1GwjWOo8XBIiK/KoNc6T8gZejBlqKOdEDIcsaGs0zB9v8SJ//C772YQTC
	J7P5eube+dRK3xJpF+qy1a1L/z0gk+AbEgfVySpBDjkYxEMy1pvn8DiAZUku7IwYOMnhpEcwkk8
	lOQZkvrLfzOBtOhRUs3D7fQdBzJhk0tD9xnRN177SEfEm67y3M7Lrx/tpBATl0bq7nrI1DM7DD1
	rcutIdvg7Qwt/9JAWk/81Och7+aQdW6uzGNoHjQcUQXkjjpKtFV7vqGN8P19tsHSR3M1njyG+f9
	7jZ+T0NGvKlQwDCNL79Sx1A+R1Am1fS3EdieqDVAJnNeFFKw0CI9cxWDEuC31xmKgUAbMPiuEnw
	BCV1vmJGR99Sj/56b67DMegZgXXFran+dPSgw=
X-Received: by 2002:a05:6830:44ab:b0:7d7:f5d4:ef5b with SMTP id 46e09a7af769-7e3da0973fcmr1898414a34.7.1778681202845;
        Wed, 13 May 2026 07:06:42 -0700 (PDT)
X-Received: by 2002:a05:6830:44ab:b0:7d7:f5d4:ef5b with SMTP id 46e09a7af769-7e3da0973fcmr1898358a34.7.1778681202366;
        Wed, 13 May 2026 07:06:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95152b2sm4047227e87.11.2026.05.13.07.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:06:41 -0700 (PDT)
Date: Wed, 13 May 2026 17:06:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: Add support for Display Clock Controller
 on Shikra
Message-ID: <dt5j7khzvgoj5qdrnfoi6ssye23jve5gjta5qx2ubuvufjzr2w@puacv5jgosmb>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
 <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a048573 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=39BKs2L7sj4-dcXLI8oA:9 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NSBTYWx0ZWRfX/4ycZnmlteLF
 J5IF7GowlQ3TKBZPywhAU2FCORW4yS3noDAd+EkQApA/Gq4wDxc61UmjUjtn5DCVr/ZvobVYwcI
 pONu0ARYkzG7/ES156DjphmKx2tZHdj53ddFG7o67qR12FAPxhdFc3Dy8gR+JyQD+3+Ln+LwiD8
 KkGSY9zSfCxce12FeiKo07baD+BPjWWh0XBPsNgfmNI6pkwVCeBL099KQxzUDfEtneuJ0mtOmGX
 m2Na4GGIbZK0s6P5mb7S6g9/yyivf7vRT3tUpG5LiOh4L76FsDnzH4I0t5N5NIdnnSkSnv0wC2A
 qTUjeC5vBz5pquep48rwVzEX+ljzhEDfcrc2nP+lgds31rNT1X5jVNhDw44BV63bFzAoG6qk5i8
 1tUa5zTTGIsFlUBeqh0IcHJaoIU9N2OjvkkEFPihMG9wKF2aAHymWYkIqUdcEy7RIoRrVCwVFjn
 xBVeQAlYX36xVqLNp3w==
X-Proofpoint-GUID: EsNefDOHg927NQ5uu7a30iJ3yLeHGFyj
X-Proofpoint-ORIG-GUID: EsNefDOHg927NQ5uu7a30iJ3yLeHGFyj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130145

On Wed, May 13, 2026 at 05:01:16PM +0300, Dmitry Baryshkov wrote:
> On Wed, May 13, 2026 at 07:10:38PM +0530, Imran Shaik wrote:
> > Add a driver for the Display clock controller on Qualcomm Shikra SoC.
> > 
> > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > ---
> >  drivers/clk/qcom/Kconfig         |  10 +
> >  drivers/clk/qcom/Makefile        |   1 +
> >  drivers/clk/qcom/dispcc-shikra.c | 565 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 576 insertions(+)
> > 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

After comparing the files...

Can we use dispcc-qcm2290.c instead? It uses clock-names instead of
clock-indices, but I think it should be fine to use clock-names as a
one-off.

-- 
With best wishes
Dmitry
