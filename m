Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106812FFDF7
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 20:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773086944; cv=none; b=uuDX6jmSo9RxWO7SHke6krumqG2O2/G/Rer5Ogo61Xyv1pGPKKYYM0GjQ3ZIVA35h3hHyLFZr6fUHbek/XM6gUbCfcc+saMZTjl5d/jJzDUX+N0qbvNfzg7HSbBsIUt/zAbDbg0qvVIE+BJRI+v7bzbikg47arT/qDjmw0Vtpwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773086944; c=relaxed/simple;
	bh=CivJSULlcUm0R2bIxIpB4VJIERX5iO5pQAMhO2JB8cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlZ59Xb7vrfx0BuZft+CyfQVDQhyJYR/uKB71UY2rGHqiDCJ6lNL6mpC1+uLRxmmvoklkz4jTbUZAT+y5i1w9VM0xnVn4/Bj+KtCYaEoQhFxQpfnj1cNLZVEGogfEFUxhG1CxglEWO4u94UWHB38s89OwIzgiJ6l1ieVIVb+IZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pCVAv5Vf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5IXX1sc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pCVAv5Vf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5IXX1sc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC0YO744374
	for <linux-clk@vger.kernel.org>; Mon, 9 Mar 2026 20:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sfUKW0y58mLW722mWNg/T0ju
	WraeqYsHF5gBWmkSdLU=; b=pCVAv5Vf4z7opukgFZgJDKJzdQ7YLr0+JcyiK0Ph
	4/flBE9pfFpjopTmsg69Ps4UcajawjmRONN71jlI8E2PmnbdIEkDBngvl638jGCt
	HCQu7FjYP2tABBwP1pugI1fCBf76DAdSpsz+9OBS1ybwS48cYFbGJfDBoqPU4TzC
	Y7UJTjlesF3AAbeljxaz+UyTCufxa/5sPwO+ZsBQtoU7MxulMWNlmXckjF1H+Akt
	RbIJMXbr3+AHM/4WtovW66kO0nMjxZ4y/sWr/F4NOKfREGk/TXBZWQADC7/TiKDG
	cJ2SAjoBkkptX7D8WVC2GPpWz/wip0wkOEN8OEWRwWqMnw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsaab3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 20:09:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd81506677so963792285a.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 13:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773086941; x=1773691741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sfUKW0y58mLW722mWNg/T0juWraeqYsHF5gBWmkSdLU=;
        b=X5IXX1scC/hQ0he8wA32Uh1oXVTFwyIr8B1MInx+S0bJSN8KACsSW+Tu4qhUkXY3X4
         BXq9fEcLIOxX8UQ5bquzJmiMd8J28UIgJV3ECkVNj1xz2NaMNyzZ0xIOp6FvCgZiQAH0
         7BaoftKh34Ce47W9eyVpze/tU+WSG1krdRmenKu7XToEzoE3bMpmzJhCFtmS7IqzFvvF
         KRaPDUikMrHqL74A5ZXvWqrZPNyLJEU70I9sgUk0buiD66aoDpsk8NEcKG8GTJnXqELB
         vKkBOZvL93U0Gb6YpPsCyQY3dgtQ44/Ap1lDC1VOeocGWm1Y2Ny9JdrFjMCSkZbkStRP
         6f1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773086941; x=1773691741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfUKW0y58mLW722mWNg/T0juWraeqYsHF5gBWmkSdLU=;
        b=lffAQTp3iDehgwsoYrMa38tReR7dbYsLN0m8cZezDDurwRRJqh0yXzu0JPO3gtQEw4
         R2wQQW7AYoraa8pCJJ/Gh89CPMA6EKppfrZyMZTmlEm7QiKeLCLQTkzmTLxUM09Z7QSc
         xmEXrITMdk19E5v6JTdRVawWnQg+kOiZQ0speEOMjRho8aw4SvwJLiy4plDCGoHJEgZp
         pz/3WcySKtecZiNF9weWzIqt/7BikF8wjWVlTw71R/oQBr3dv/louH41ichn93r2D/9n
         FHw9+NwusKl90+kUkFenu61WjDgOUTY10O/Jf41m1xlooQUfcjrdehzcencC9HSAjKdP
         f49w==
X-Forwarded-Encrypted: i=1; AJvYcCX7JK469GZ+URJy65HnZLuFJS7imNthuH9vlv8AjFdECEPLmJ1Q+CfHsa46RAenVh3MJJ21njGuoxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEducE1+cFl5f1U68fubJFVvsx0fjqsuf1z+0bO93EGu/IvwOF
	WfhlYL1I7/frE/ejLrLhwV3N+2c7fcZmSCjmmfTMyBrYTAu7N3POqHKUHqkMm73QY0ctqYZjhRs
	xtOzzH2epyBKYB+lubH4z/gmDfLNAit2hVCscfkx35NdF6KYo2NowTW71/s+kDiI=
X-Gm-Gg: ATEYQzyoipeJy3SRFfJ+iWrq596FtR5ugU3/eWD7V6AOumFHvv/9bFwUY61MA/UuOPJ
	g07wrfA8qyrAkCj0Id3MqrGiqKmg+uEfa1BNiarxjawEkhSORlvRPDVgDtvcdp+lDXn47YaVtZw
	EpzQrx7htfL/TxLygcFQ4J26BMdcWbhmlyBKvraoYibgNBuFH/kFyslQrn1kUWnLkxCaAANH9Pr
	wIci7DNv0YCsbzPwZtpRMDNi3mwGilxSGf2N/jWPJJVO7AuyYd6EVfuiaP2A+rJugzQkxzNl24V
	3vbXebJ9CyUW0NpbMoo/z8ZOtZMTK5sVhE7eLmv+hejuGrLOWEKGNVYzWKBCyaysJkxuiQZ+hs0
	3/J02rPLVjnDSIz6DLKGa3jgLi5tHHr9pVUZEJhpllWZ/Iqp0XT8M+L+9Z+oClS7jFY48joQ1xZ
	48pe1VRhAOzcqDhs4HIvskI1wKUAZ8crDYz6g=
X-Received: by 2002:a05:620a:3952:b0:8be:94e6:3e6c with SMTP id af79cd13be357-8cd6d4fae6dmr1660094085a.39.1773086941394;
        Mon, 09 Mar 2026 13:09:01 -0700 (PDT)
X-Received: by 2002:a05:620a:3952:b0:8be:94e6:3e6c with SMTP id af79cd13be357-8cd6d4fae6dmr1660089885a.39.1773086940961;
        Mon, 09 Mar 2026 13:09:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08c1cdsm2361438e87.79.2026.03.09.13.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:08:59 -0700 (PDT)
Date: Mon, 9 Mar 2026 22:08:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] clk: qcom: gcc-sc8180x: Use retention for USB power
 domains
Message-ID: <axivj2gb3ymbqjlu5xovhjcprloxw5taeja6vrtlirna6limbs@5umxnlw36utp>
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010214.224621-4-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309010214.224621-4-val@packett.cool>
X-Proofpoint-GUID: gJjVwynQnmCPXT345RtDS4a_tZ6woPT6
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69af28de cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=M0n0xMwgRafrvhQXqkIA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE3OSBTYWx0ZWRfX+0X4N5cBvnP/
 RC3cPVE1YFgeKTiz8YhDV/+NFtyC5Uhcizd1ZV4bQ2gYfuJ/h2rSbwpFWYfaGdsR4ffWc5MWJSO
 FEiU8PVq/pH0dfncApNlrXJ7vPz754tx7NOnAPRhPKNDl8OnVq9QRWb+Pc6aS3yoCsJ8O3QsQt4
 CluvbgSkT8lFeKXj9+LN07VskN/1+oy+AgWTNtdIZDu/YYDjqAL4PPYxWJNwkclxcps5oeZXjY9
 RMuxUdAQVRhKAdG+JdKEnQwEz40Ji90EyYW8kEVBHuZMuX2Mmzggqmvs5tTXqOeZ0hxZdJQNBLM
 /eM21HEdI4PRUd8rLxRhw5tRzlu5jlf7LbX0mEoxB5PYkj26riA7o5o0sPkBkASylBnqr6hrskW
 1Uo7rKdE9bR5AhPQzvZr17OFmRnd8Ykvjm7Z47YbA+t4MYcdXde73CAUgEEpgBLMCyL1lENWGMa
 rM8fa92qbkx92/SF2JA==
X-Proofpoint-ORIG-GUID: gJjVwynQnmCPXT345RtDS4a_tZ6woPT6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090179

On Sun, Mar 08, 2026 at 10:00:25PM -0300, Val Packett wrote:
> The USB subsystem does not expect to lose its state on suspend:
> 
>     xhci-hcd xhci-hcd.0.auto: xHC error in resume, USBSTS 0x401, Reinit
>     usb usb1: root hub lost power or was reset
> 
> (The reinitialization usually succeeds, but it does slow down resume.)
> 
> To maintain state during suspend, the relevant GDSCs need to stay in
> retention mode, like they do on other similar SoCs. Change the mode to
> PWRSTS_RET_ON to fix.
> 
> Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
