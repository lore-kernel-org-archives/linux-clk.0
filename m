Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2438D38C2DB
	for <linux-clk@vger.kernel.org>; Sun,  7 Jun 2026 11:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780831110; cv=none; b=c/6aPC0LLNIoTS74nmwcdSQyhrZg7wLppYTEfDCQvvc3XpVNd/6jXc20Jf81Mt+3ACidUDyDTZrCOHEIdpCftSZi51lcC/jFvEY6uYMaQ+jMLBVxBWkqpktoowYCz417kWs9PGDQNq0OTE8Xxg16NVQVrrTz/VXoPWFi5jAh+IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780831110; c=relaxed/simple;
	bh=J6wD/DCzsNOn/MApc0FLDSV2u8AloBttXgf4EW9uKXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsUQUxLaP+XjWD7WniCMu99YdR2maWpT44BoKsZXKowQDPuf5S6mjYBmAsADKb6UIeHqIGps/AHeqQedI2osCEZvFCuPqWkK8a8TvVIZSelbvqGt4HSCzZPX9RdUVETfFYWF/zE3a5ySa1IBZi7z3HEaXo5t0wh+k1WoYf+WHNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DuLaRoS9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XRxlUVVm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DuLaRoS9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XRxlUVVm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657B22HU378009
	for <linux-clk@vger.kernel.org>; Sun, 7 Jun 2026 11:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gBysykimN/2LqYupOxQBdOlc
	nPYWCJPwXQfmX0+Z4dY=; b=DuLaRoS9hSDvVVpLLqpW7DwbmXJNfkSSTakC1Pjf
	fAOtMG2ZWoEA0f9bbumFIyiH9JczqDbSUiACqA3QHZpothxCuS1A01r5MEeDHQ7q
	5uFvfXLVnVyR5R6S0pn2vu2/NrUOOPpfOyIQcbEh9gHPtp0ucEcp41DeKXU1M4cQ
	LUr7BK6Ts+V9KpRMYyy4UPYs7xqZ3q1045eIcHQW387viOeEgxmIqc56MJhYLL2l
	DbkAvaWlxLeldh2va6/sTAGWlKFg4koDhYkFbCd26Oz2IVr9SczaOocwyTVE185P
	RxyyAISm0lG6rrDf2gbDcLl191l+ja4lAB+gjD2HPnL4Fw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6bkkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 07 Jun 2026 11:18:27 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6798c46f723so2012402137.1
        for <linux-clk@vger.kernel.org>; Sun, 07 Jun 2026 04:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780831106; x=1781435906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gBysykimN/2LqYupOxQBdOlcnPYWCJPwXQfmX0+Z4dY=;
        b=XRxlUVVmI1YqS3vXAvGe90YJHRkBPLNNuau68I0lmplBunfnqSd/wGCHnLQaJx8J5a
         soUVTkrqP05C4Xl8B0zBSL+8otX00u8ZBvo7VLgcPSERKCRadGaoKfLkJQm1gwqGm7sX
         OUMn2cpraVvbjXViQdNaSzThB/bgguP0B5BBjg96y6BaJmX6Zoca3IEPakrcncfmVpHQ
         pwidmaP7SVjBmjQnXvuT4FvruDEHrKb4P6vmoWNIqvufOcJs6ep8ezlyqOZT6P3yUo8g
         tCpGH6eFw3Hr6zRm6wUOLb9vTULePSOISVPhtwBQUklIKmxRL5Zz8cBDX/IZhgixIRyY
         mbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780831106; x=1781435906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBysykimN/2LqYupOxQBdOlcnPYWCJPwXQfmX0+Z4dY=;
        b=ByqsjBADrIZ2IvtLZCnX8HGnkG212wmXkesEfy74k7s73MYQL635tKnJNEVPxJmTC8
         NBKW9hxgtBFj//bpISX+vWpHhKVr6kvlM9TiLItWcjbIHGpZzPm+2Z3OpLjZD7tTpaVB
         enSh5TypfO0SxKybmvNFVBzEmpbbVkeuml1r1YoSSGdxgaDXsUW0vo8VqhQrcSzD1KTz
         ZPJRv94Um39yrnxBezukrn3FcruEn3kkW4aAq7JHY7s4g8MG2BwKXchRLuY8YMBogLbc
         GETBLZgvEPLzfZ8ozJOAY2yMWh4Fepp2h1TiEfmnyOvF/6qZCZHGlW7Hx3DweD1weCb2
         K4wg==
X-Forwarded-Encrypted: i=1; AFNElJ+LqB2gqwFkt/J/bDFDN/0dr/1k+hmccFGcw/k32Is2IlKdrmvCYL9Xvx2f+uLyGr4MVjni1S0vpwI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxqMrZxluzQQnEVryUP6r+yDfFjdzOw/b+zoXrGundLgllzEU7
	y+sjj6V6qRSm8Wznhq39ecunv65CKZjoc1tjHoadlAwV8bHQsdOT+N33/iAusdtY6u62NENOIB1
	fSj9HWRJnIDN2VUoGV0jaXB7PxOTmxgBD2rU6lsyXzswJse76lzLGOaaYxLymBgrZifv648k=
X-Gm-Gg: Acq92OEu1PD72/ewP25SodqW1c9D8KzO5Qx8+lH+UrOEF6B1bJSvWIuOQA2y4/QhR/8
	9xDlMNsVnzj8yC9W+i7oY9L/SBguSTU+PyS0/tlCICcWkYRyIafawFkEeYKVQeCZOmc7jHOv6gc
	BYnIx676ewaOrSPviRkxAyyVBxGZ9cyVbzrETMKqL2jX2FIvE4R2/VZmudHwtD/h2gCGwpIGd/9
	BLr9dO+3D5MkF5jEb7A+jmDnmievyrzyklnEKnsRg+dKRe8Xs2RXIdhFwaV+3fkxjin39+i2Sww
	4AX3/tzJFfl9aRhTOBWsXxF97IzhjBYeGTNmEU39JXZXLnCSTA9ld/6g6NjGJJA8s4/bnFGMMbc
	V2+yYnt0b4gTEwm5jJ78JJdTrxRUO+ymm6YtypJf2Ayn3QeH79ia8b7yPiVyOdppcDI+kZ6dQ1B
	+G5Kuzi6WcMOY35TcfNH8BGSl6P5Dl/boT1SsuWeh+IQuEog==
X-Received: by 2002:a05:6102:32c8:b0:631:4cda:3e86 with SMTP id ada2fe7eead31-6ff0610ccffmr5411916137.24.1780831106395;
        Sun, 07 Jun 2026 04:18:26 -0700 (PDT)
X-Received: by 2002:a05:6102:32c8:b0:631:4cda:3e86 with SMTP id ada2fe7eead31-6ff0610ccffmr5411905137.24.1780831105936;
        Sun, 07 Jun 2026 04:18:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990486sm2971499e87.68.2026.06.07.04.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 04:18:23 -0700 (PDT)
Date: Sun, 7 Jun 2026 14:18:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: qcom: Add Qualcomm Shikra Audio
 Core Clock Controller
Message-ID: <foutgm5vhldz3verik2mje22nrnu3r3z72mxah5wmmuoro4l2q@ud3nbdgctpjl>
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-2-7ee6b5f2d928@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-shikra-audiocorecc-v1-2-7ee6b5f2d928@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a255383 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=3S_noIeE2reKQbcw9xYA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDExMSBTYWx0ZWRfX2VL0P8E99cGZ
 +NgUq38slKyEZjJ1q0qYH1cTi0/vIhdP1CMfNE7p6vc/67R3dxSrcVzjS2K0TeGZ5ZhlgTnM4iu
 IAhsDOOIkaUmySHy+1q5onh/RZSARv2J/35SG4DXMC4luwUbI5UXZRCw4svCrCvkuo4yXgKDefM
 RzXP6QEneX1VlVoMGP5nCRIB15Prig/SPOeM0P/yta+PyvmWOqJCl4TL/oSs5GfwyP+B2idI9ZF
 j9igZRzAE+TtarvYWb5c4viVwyiFGIWAML+w0qRqhj4/DsVciv4QYrbUSREE/cHXp87SjUAuO+I
 0Ne8yBMwBM28hoTbcI6fZaHuVU+IYlfrNm+ibsCpCw2Oc5mY1GARqkGDh7JpdRwuLA10fcUW+rh
 YXNQWXjrA8/2gYVOz6W7roZYnrZrdaRa09JuDfR3semSVMqdLK167PHS4pX3/N9RtH5w5IQi4FP
 MdXZshSXBrvWrtqOa6g==
X-Proofpoint-GUID: 6osa6WWmQ1t0yd6p7MqGDRcEKJJKmDab
X-Proofpoint-ORIG-GUID: 6osa6WWmQ1t0yd6p7MqGDRcEKJJKmDab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070111

On Fri, Jun 05, 2026 at 04:56:31PM +0530, Imran Shaik wrote:
> Add device tree bindings for the Audio Core Clock Controller (AUDIOCORECC)
> on Qualcomm Shikra SoC. The AUDIOCORECC clocks and resets support differs
> across variants based on Audio subsystem enablement as follows:
> 
> CQM (qcom,shikra-cqm-audiocorecc): need clocks and resets; audio on APPS
> CQS (qcom,shikra-cqs-audiocorecc): need resets only; audio on Modem

What does it mean? How does CQS play audio? What does 'audio on APPS'
mean?

> IQS: no clocks/resets needed; no SoundWire codecs
> 
> To handle these requirements, variant-specific compatibles are introduced.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,shikra-audiocorecc.yaml    | 62 ++++++++++++++++++++++
>  .../dt-bindings/clock/qcom,shikra-audiocorecc.h    | 49 +++++++++++++++++
>  2 files changed, 111 insertions(+)
> 

-- 
With best wishes
Dmitry
