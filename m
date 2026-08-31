Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF286488757
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 14:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185438; cv=none; b=V8JpKcJiW9sFFTfetxsSJuxwKUR5afZy51Y99F/h20hBSJhlUk/+5PLvrO5L7QbWR5Anz6G1Qt0AmHlP6kRc7JrRceDtxYs7aZ8+8TP/ZbiXd+8YjKYd7hCbV+5xAQ4ecq+PI4QWOP7VkX04iBgobI3oUr8EYs4dG9/yCZhHSUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185438; c=relaxed/simple;
	bh=s/eJq3AC+D6A4TkhQtv3jZ3s2XvL1jfXt0xs+Kf1ZfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7LwGFWLo3dSPhHkm3WtveYk4Xg+uOlr7latiqGKt5DpWSr2IgsjRaPcp0abr9jURyEPMoEr2fc9SaCKsA/WbNh0LO8Ngs6Nr73vOCuJP6HCaQsQzlVdIkbrJX4sy/ND9srzJB6S/VEVdA9hfdZM5fkqAFEEuls8uwHfidujvCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kp/3d/hy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b9bMMWzj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kp/3d/hy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b9bMMWzj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBAOgB3255718
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 14:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iVFh2LW5L1fu6esOaKgWGlZN
	A5ALr/AG5W+DG3xXBV4=; b=kp/3d/hyBVmPOO7zUXu6ZMkJIT2fQxXY6ESAiLYm
	n+bu2h3deIJLw258/8JFru5bAgTCUq75+k7SuGnDt/bvpJ+QD3Q4NAk7jvbGDwh8
	9Hwd18OLIp4lzkQz3/Kfe/RDfnS60OEYlSkZA8AJy0XVV9rHRNN/bCTzlgjdTblI
	8FPFyh5MiRhd4o7RostPozRjSJYlf+8h2dg42L/hJ9ywAkSC862Gv4HEovoQoNN2
	mMxHBBeUzVRlDoybh/fC+uMTHU/K78FFf8WkPL4SpA5p8RlInqyPEymN9pSRV3QF
	I40H+3YY0odD/+C086Q4pN1lVEvyi82uAGLn1GI4VIVO8Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yas5af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 14:10:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e8341cfb4so30591996d6.0
        for <linux-clk@vger.kernel.org>; Mon, 31 Aug 2026 07:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788185435; x=1788790235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iVFh2LW5L1fu6esOaKgWGlZNA5ALr/AG5W+DG3xXBV4=;
        b=b9bMMWzjV0CyEMu/xrESXmIyQzGq29wCcjyNXVycfixlrSO7PZamQoj6LIg1j9SmTP
         bNn5iCSValxx6hSLV3PUS/07nxShV7CJRqfKD5lZF1gW9MFSRPYAqpKYJ1tvHtnQIGSm
         9Mmghg0iElbJXJz1pOk+ENI3AKsvHyUJUIPGWYtwXYGjGywsE3wC7au4b5RZrczDIZ68
         hJTGU1gOWE3jLjGt3Th/FqRJoRPbosGjGQzVzJ3Pt9C9dNPEH+gTVDwvTNomNEGgySIV
         1wE0ghxoSaQIepC+qlZdfhUhhti+2LukCc/gQUBfH1cZR7H7LmPBhq2sjQS1CPM0VNdj
         dghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788185435; x=1788790235;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVFh2LW5L1fu6esOaKgWGlZNA5ALr/AG5W+DG3xXBV4=;
        b=rnjcZSmFUFsaL8fSY8EsdeGSRj3d1c7Anc2wC0jQwuT5tnHR+vul7B+LlEcNZCMWO8
         gR3fjNvQ1a4Zsd8myoLcOBwzDN214zmvbyIcO4yW9gG+dyz2NQwcDSx9RLbj9zt0oCFy
         qfUAGmvp+Ej0x/57S6hchLrGSeW0QZl3eQx2y4pV+U1Sr3RFX3QWvoYoTBbvURdKNaMt
         WxWPKU/oiBaemt2oY8MDMk5k3exUBRqNflGMfyQTpAcpkdu+ykCMhVrptRYHGix23jxc
         AxjX59uA8qRPtzD9YMAGsS+Cya5Ko7vsoXWLHIO8ZU7bfkwwnAFz2Ym+PU6vD+uNmeZf
         4aFQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro0mRxZ7x5aSR/iy3G89PYl58WIavedhj/vv/GuE8ZzmNPP7Up9OrlIB0YXOrIskF4DEsjy3kBF450=@vger.kernel.org
X-Gm-Message-State: AFuF++mJ5G8kd4uYzFAbx/QiRYs/EOrUIXbsIa1G+L3F8hiLcDDKQ8Vc
	D2snM7AgRiYVDTJZtBthdRb2fL375Dgv7c5xnjJQvoWrilE5vHMSHyVbDo7Pr+qzNDxhx4aSMZy
	ArHTfpCPu04QH3uQdUgKziRUkQH2dX12/guB1sXlXyzL1DkWji5CFOHBIUGcW0Ng=
X-Gm-Gg: AR+sD10N9xwofC/rNyLbQl2KVoHYqogg3oNr0Cyy+16yyEB6HYKNXz7+lyMv0bpAsCj
	Nyh+hKDG7lkFrEHWXjJKYW4YN0qc4znM055mMx3/XgmJ94cCaRTNBRe6omMrkgzToUS15YkkA2T
	lsMebrQEr5izmgrLahSRmqUmz7uY6eHmPEmus0Lkaj8OYn7k1uh4G+R7U5ZbTTcsv3mvnZYfzWa
	fwcWEifSDQi9sh1OHBDIxoRMkC53Xp3LAXRw7DWJywm2+Pskmb7qJ+gJMxwAi30Z9sMpm3XNtTE
	kBIQYx4qW5hH0XvM2Xq337pCucaR9HoFi5q5T1tc/yQCAtjD+kYT/QLqAG5Fz7J9vVvYsvaLmnT
	0bY2ySc7jzacG
X-Received: by 2002:a05:620a:710e:b0:92e:ef09:f8f3 with SMTP id af79cd13be357-93913783b9fmr3153279385a.2.1788185432583;
        Mon, 31 Aug 2026 07:10:32 -0700 (PDT)
X-Received: by 2002:a05:620a:710e:b0:92e:ef09:f8f3 with SMTP id af79cd13be357-93913783b9fmr3153210285a.2.1788185429688;
        Mon, 31 Aug 2026 07:10:29 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4942298fsm388336305e9.1.2026.08.31.07.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:10:28 -0700 (PDT)
Date: Mon, 31 Aug 2026 17:10:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Sort Nord clock driver entries in Kconfig
Message-ID: <xsjednoivela3axky2rnblvumqbp5x2p7szfrh7km5iq4mysup@mslleonjlyzt>
References: <20260831134717.510383-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831134717.510383-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyMiBTYWx0ZWRfX0b54705zhzvg
 XKW/MYaKZ7Gfp2mXkC8R8jSaBMfZ646B8O/NF571HhOgPmEVI/7Prx06xONzyAeVyU6u1d9rCJW
 fFW+XyMvLU5g8dRsgfMClHivjK3nVLk=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a958b5b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GoVAX4XHNZ9XBqBwuDoA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyMiBTYWx0ZWRfX2Te8qp0aX7H+
 J5Yq62ho0txxHeBjWAQT78g+x4bL9eBLTdPCpPa3ematDiPzkRnOETvmc0XnSwvKd34CPCKj+aA
 CqdtGUnqcMXR/rOMSqJyiaDUSfWQlqqJla8vCBo5yJMMp/GliqbtGPScvV/Fv9T1bBr5LLjK09I
 FOaoX6YfMYUtXSYM40TnlPfUP12LwCD+vi+wIdoFh+1hEKvmjYUdyRTxmmSzsebhdXJXp5NK+b4
 6veEVetpRj37eK8Sei+FKGFBHDsnNW3VpOkRLCr4dkxEP7S/aQuPRWCRQb6LQXxJv04Vmgyykb6
 YRqVlYG61xLXE8ObnH5irCfYBY1SGXcbN16Nm4OToByx/LHgozckrItQdlQcUR3lw1D7iFQLa3c
 yVtETffRQCjv/FUz3FbBo4DlfFU1b21rtuAR7hPrbgIyyWRS+IXTZ7dpg6UajrHz4BPhYmV5uGk
 7EBuTA5NCZvmAFC/wrA==
X-Proofpoint-ORIG-GUID: STIzULe_0Mb3ksx1Zkfhj-tusH9gSPhi
X-Proofpoint-GUID: STIzULe_0Mb3ksx1Zkfhj-tusH9gSPhi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310122

On 26-08-31 21:47:17, Shawn Guo wrote:
> The Nord clock driver entries in Kconfig were out of alphabetical order.
> Reorder these symbols so Kconfig follows the same order as Makefile,
> making it easier to locate and add entries consistently.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
