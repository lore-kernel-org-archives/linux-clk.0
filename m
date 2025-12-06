Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94F41CD1E4
	for <linux-clk@vger.kernel.org>; Sat,  6 Dec 2025 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765020882; cv=none; b=fVx+2pisbXKkfau6vE9aEw3BCK4aka+F7LMhE92uCd164+nQmOeHxnT5Pf5CD/eunGLbDPBeT1Du2bWd2bfFw/ep0McF9/WVjm47CwSxonVZVFdml8iV+mvBlbRjouKqkegYuZZ84EklSNQ4LJdc7TTNOoRFWXFw1YhFjTFG4pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765020882; c=relaxed/simple;
	bh=xSpsL4b2zIce5I2dOY3sUE/zfutjJQr0aBnTyOnstvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdymGBvLRqj3li72Jo079gJvv3o6l2OiPVQZivX84Xml5bTOBdQDJgcKAYcRL76H2amrI0PIuoavG7MapZ/0p+bFIQ1yaWJqvJmmyGujdHgZNUmFBC+hSuDECgR7Xxr3Bz+iOpDtbRsWLIXtLYj8nM2RRGkpZAIFkTEJOks8Bwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1xQinm/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOiWTpKC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1xQinm/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOiWTpKC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B6AXHUq2484641
	for <linux-clk@vger.kernel.org>; Sat, 6 Dec 2025 11:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bia8srXgCCulvEvzZIHpajn0
	2TpGhEwIbTJuZhXTrb0=; b=W1xQinm/k4e8Zjtl6BngHFIx1HzCJ3O3vhKzZ5Qx
	Zj1xYMWyGkD2XGnAZdeFDJNHEG4H291hTSnsVX2K1ZfBirZ1zNDedctjSc/mtslD
	gcsgqPuUJn2VhkvIGwBRDIl8ilBguyxtT2f61a0dHqQAC8nvWy/B8kiw6N9qQyb4
	3FrxM3dxyO8foH358Ml0m36Th/Wd0g6hfDcK5oBUANFjYgqBGOF9QCxJE8NqC1VG
	1QCICFwIHcwq1IZI28/I2u8Y7ABENn+6IC2t3aWrbAc2fb1QPzU4UPeRyfmER52N
	TOmjFedzYMu50e8W2ap2nR9F5q5Rjb5qXtB3VJ5QtjzQjw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avds98hdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 06 Dec 2025 11:34:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b55a033a2aso778685185a.0
        for <linux-clk@vger.kernel.org>; Sat, 06 Dec 2025 03:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765020879; x=1765625679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bia8srXgCCulvEvzZIHpajn02TpGhEwIbTJuZhXTrb0=;
        b=bOiWTpKC4sCTXm2pzLPOH8F0AkokthIDGEB3D7pbchSJjfcQA0sbeyEfAh0QTKgT3M
         W7qDPWC76MjkBzWAo20TTF82YORJzrM2aoPsLwaGEtnWYGuoD+oKbwORlqXRKi2QdnE+
         QSbMkskJKc44DAnO8GubN7J6ZUiTWiouRBRgF6/ahuqN8qE/tezyBBeWgi6b3PLAkLuV
         wfIO/oVO26IYQS2fv5A9Sz59YgsLGcl4KHwE4w6vWdA0I+sL/uchEWGqZebopfcCp/VU
         D86BssKVzDFB59cMb3gNI1eHub77fkGqY2z2qRtNrIL5nSDgiUdu7m1ytbr96JtXCrYz
         UlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765020879; x=1765625679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bia8srXgCCulvEvzZIHpajn02TpGhEwIbTJuZhXTrb0=;
        b=qCIzEvSvZuDSVtQsYAyGcdu9aGBgbJb9Q6uqPz3yMeutWgLcsgApvr638smahyNmGx
         P1PZsDodqw4repdwEPgIv5mI8gxpEgFHhB+5tTW5Ubk7P0b5PgZsa8Sq9sgFwQDyRZED
         xYHuv7yFk68+m8+Pb0rBbMWhoUdgPvxMwyLfhm2M9CT5GfU8lMXYEZAmO2TC4T9aaYcV
         2t9AtRNijlo9GR719DQrljkpGO62S74xDrh8BcK4sXz1obE05pKCEh12LHRoA6sZpdYX
         AGGePNRJoo73pfguiIuSyL6Ydlobr9b7Y2BYWjoSyhtwmzqfAvCY16Pal6/ZQt/JKrcu
         /keQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzRb7/uwc28RQMJid1vgT7wArNvHXvjRxH7rm+4uAowjelVg9wxVwdnJI59a9nepgUVmMO6fDA5j0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhahnDbdiefGOEU5t+YykwZHkM4CcbWD3sumskresSOoWV31Jw
	s932WwTYvbqfYsS/wJ8kxWqn0YkWCBvmMHvFvj8QpEmXESpA2GgFZoc6IH2a/5eIguJ3t3zzr5Y
	nIBYFTdvNPABERvwu2zhnJ3vsc0M1PwO0RgNUOtphFIMvmootEaMVrMhWGVetPlk=
X-Gm-Gg: ASbGncthSZ1Lx3f/8ejQft+iWhFYsLzoZ/gnXf2mj8VREcjPOqMhVemzjxUZKCuUZbU
	8DYBbeuOiiNaiiEZsJEi7TGsKkBVMlLIosNtBcCdq2W8naMDX6oYcDpVvIFCVpvv2ZjxDqZuh3/
	F+sCdaXw60/ATMhTg/kwF09C0UujS7sE4v8P/gqT+/eWJFNnYH6PwuuC/2Era7lmp5QL284akau
	ZeVPp1lZqc3k23tF4+H/FGmm71V9m9ihsBrI+Qm0j55n7f0R2yt9ZXZZMBa3xnqRM8bDP7TCQuN
	nLHT3nOxGTysqElY8/Iy9AOCHNU7PJ4XctejPZbdDuHju+1TnindFVFHYnYC/cmS8L4DGlISxPt
	FVDvq3PQKYpZ6cakqdjPsElOzC0f3rl64ci6HPMt3pTXTRJ6q/6diXsAeKhMThJA5gukNPeLceO
	R7J6NX4Z5bsSshHit0uYc/Ltc=
X-Received: by 2002:a05:620a:4104:b0:8ac:70cd:8727 with SMTP id af79cd13be357-8b614181173mr1493844385a.11.1765020879149;
        Sat, 06 Dec 2025 03:34:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2fXxn9oMzhK0QPHn8rc/X2u2cWkcH2yL22YeCAgzaS5FxBN40uQmNdOsi/vzAl57uAfIr/Q==
X-Received: by 2002:a05:620a:4104:b0:8ac:70cd:8727 with SMTP id af79cd13be357-8b614181173mr1493841485a.11.1765020878685;
        Sat, 06 Dec 2025 03:34:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e705e8292sm23397261fa.37.2025.12.06.03.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 03:34:37 -0800 (PST)
Date: Sat, 6 Dec 2025 13:34:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] clk: qcom: rpmh: Update the clock suffix for
 Glymur
Message-ID: <tp2lubkvapjwaxs6htxifnf7hm3y7barocfupenkvo4luw6nl7@z7hx7evwrl5j>
References: <20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com>
 <20251126-gcc_kaanapali-v3-v4-1-0fe73d6898e9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-gcc_kaanapali-v3-v4-1-0fe73d6898e9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: e2m-yTtz5YOXjlVqQrxMwFHU-SIwibJY
X-Authority-Analysis: v=2.4 cv=P+83RyAu c=1 sm=1 tr=0 ts=693414d0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GmSRHzHddRRQwDRSliMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: e2m-yTtz5YOXjlVqQrxMwFHU-SIwibJY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDA5MyBTYWx0ZWRfX7pEghiDiwePR
 xF2W80Sx2VYP1S5mFARsnXIfh3bYHgHRXIEKY2pGTUJUirLHWO/LKJmgtuEp1Ah9Gx4QJPt3AeK
 v5y9duIotioqcECzKo19888DOc7s7SeAUiZZ6uTsW64X2ZPSadtdNRlivFPR9Gvleyn049sLhrL
 ijpACpuL5aSmIpat9j84yc1YMASgzWynvvfXhH2k6eFQcmWEq3fdZf0BHn3bfAPq+oNuUhXvkg0
 AxG0FuLpXfSzTO16xCkxNsIiQxW6lqpEV9M35uQZrvDHikfBwxfzVa9psI78VZlCZUfw5zqVWPo
 P+mK6q0IkRenzFsGb73evBeOmrj9eeT4zye93sco8ERqU34po5S2csk+337xkXrR1DyXtwjQSox
 VbgdhFrX3G9b3d5x2Dni7NgcOKTE+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060093

On Wed, Nov 26, 2025 at 03:27:15PM +0530, Taniya Das wrote:
> Update the RPMh VRM clock definitions for Glymur to add the suffix to
> indicate the clock div and e0 for the C3A_E0, C4A_E0, C5A_E0, and
> C8A_E0 clock resources.

Please start the commit message by describing the issue or the problem.

> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 

-- 
With best wishes
Dmitry
