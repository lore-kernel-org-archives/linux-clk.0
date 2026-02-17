Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4173375A0
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 12:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329904; cv=none; b=JQuGQ1xVSa4H/bwTXttbjbZyvp5bhJu8XzJDNCWro3Y9IDygbfLJTJ8/XpeOnlpHKfSXFlTIBWoD3i9zlzFC9OohnW0i3xpa9ve68AERcIQdbnJPobqOQJHXeaEtj3pTy50q6T5RsDeG6ktBfQN9psbuLNHqBESxgVwP7swAHAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329904; c=relaxed/simple;
	bh=aVUGa3RY796+baDvlhpqGowjESPg44gTPp21C56l+gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTQtEu9mlPagx0NuNmOCv/qLVMLnWuaedrqzCIgITwTooge7KQTsD1QkohvJwLw+lWmYDzUPStkEyNe11J54ZqvcNDRaTLq7khJSxye9G/sKVI11qy+pjnSzxXxiWP0nweXCklu+SmjcPM7r8q3iZjPE4GSSeV/uOyCq358Ej2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2od4Spr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YWBuoyIk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2od4Spr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YWBuoyIk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H7hcP4048742
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 12:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WN5A1Uh8FQbkVezplAg2+KPH
	LHpsIMxAUayv8oRBN0g=; b=Q2od4Spr7BKqk1uarSY+TBtIpKjNszSwilu9idhj
	WP9wPjOmr8vnvvA4VBNF55S3+B8ro8frtgHzTFMrqkuIFdhsTddPJOcureeoTSf2
	YeW8gJ5EchSqPxZcLYs57L7K/vEImRd9gR+Z+wVGVtBsYMHe8l1Akt5CgpH8tj2q
	GBZkICyotCFzOe/HQODrfJl3rS0Qfj26Vs1ooTwCX5HSZkLuqW/yd2gtgmLXlOpg
	hKGdf14Wofv/S6R5NAbh8A1Fkj4YQ3LD086SU2UaxucLb+WUF9RrEL0rycLy/Rj5
	+EHZPNx3V2cpE44ijH299VrAmwc/2MYP4VjvMMD4n9/Rtw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d8296e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 12:05:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb0595def4so2948399785a.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 04:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329902; x=1771934702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WN5A1Uh8FQbkVezplAg2+KPHLHpsIMxAUayv8oRBN0g=;
        b=YWBuoyIkPvix1p9CnDQdgau5CaG9As8WmcU49uXe1YZ7m+5asoyiWEu4BnMUj8XRku
         qNXgyuevUS6sDV4tekC7sgXUjICUYbpwKhLubvNd/Za8MRMW5bBUhVAHPCBBqfCHpBaJ
         whKz5zySdd6RtfuQMhGF9rdDhoZ/6PKy+QChGIBQWFPo6lIiljVtK8QV9BGnRP8205/C
         nAbOgwWX/zqWykDSTzXues7nvQLTMizZBjvU8yN3dMVA2okWplwBgO0sKs89O2XvGqgC
         TV3+k0SfY7Qh3YqrNxj3GUy7zB1a/ZFwUGZ84idec9WyAOwF8puqlG8hlEhSXL+bDMA5
         WScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329902; x=1771934702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WN5A1Uh8FQbkVezplAg2+KPHLHpsIMxAUayv8oRBN0g=;
        b=hEEdcIngu/kqkKmyTYBJ3BwzCKc8g2ImiPV4NvpIcx/cV/crMhbC6L0CTcaiBTUsHE
         4OzlpaGjKNenxmEE5Xq1Hb8ZwctB5ZLqHgabaGdxTwD8bGoKepXb/P7M0z3tlYuxQdlm
         Q7Uh21Pwp6UtSnhPXJRm8Xwe0Erd/hfmdKFpu4q9sY//xC0STOYORAkXsR6qk+LZ3jkx
         cdlufx8IUds03Ic1BneFilOO4VixFMiVl9hLsvo+rsYB48bLGlPpgj6JY7pHJ6Jf9leZ
         3ZVw0HfAgqnmOwNVkxC0Q2Fes5KsTTF87YRUQ/ALo/IssMCfcOEpUvQ/5eHqVJyLboAz
         mNmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoCjIPlKDAMDNhFZ5628IaSHrAMUDtvX7jwV0c0RHWxuO8O6ekOh0UaGCEC5VrpsYDso/PmfHNKsM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRIgyY1uYO64gOClxrUO1uMp0AI68mNUelLLBCWoCtr+i/q4Di
	V28k23P0f4kom2o8FEucxaqCzBh6QirOLDuJ6HWLnLMsrRB3/s+oMWIOMQU7zfJK4d/oizR1IU2
	Fec+9dQXNXSOtubTl6PdLrEH/UI+2T/rsLmaunzPUAHYdnNobsrxsQjOZiH4QoAU=
X-Gm-Gg: AZuq6aJv+8Dm6gkHRx3iWSYgJoOkzwaAiX67MPkXwVb5GtkZEhLt5FRHCkAiSIAqaBM
	Nw3DP0ifkxNg60M8cmwXB0Zc3tfiauztwAwV+Yjcq3p3s260WzluFqQ9gBnRfqC+/KOqXQcYy0x
	iUVLEPJNTEhO04Wi/1CbIGnsnGpdEXzKspyJ1DZwLXgbk4BU8ryWm5TAhcXkhNJ/CGOrrz9Op86
	S0DXBWnj3UmqZlHqI0BIijfsdrHe49pQuQde7lXcQpJaZMzFbFVPGWoBD/rv+TvohBS4WgUUts3
	vfS9r7jSv6WFuSTXHaXYM66NoLHoT9H0Tm5xlWpLpX63KnS3e8r61DgM8c2jp8P+Nhyo7Asrtfk
	jWFKimt5eCGudKXThT1O45Lu268u6ykp8Y+w+
X-Received: by 2002:a05:620a:7014:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb4ac01da8mr1242526785a.15.1771329901931;
        Tue, 17 Feb 2026 04:05:01 -0800 (PST)
X-Received: by 2002:a05:620a:7014:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb4ac01da8mr1242520585a.15.1771329901366;
        Tue, 17 Feb 2026 04:05:01 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac7d91sm34676995f8f.26.2026.02.17.04.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:05:00 -0800 (PST)
Date: Tue, 17 Feb 2026 14:04:58 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH RFC 6/8] clk: qcom: Remove tcsrcc-sm8750
Message-ID: <gazyoguari56n6t6eaxbfvgv6hsc5jaqtfkhlshkbijsilfuys@cggmczqpzbq2>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202-topic-8750_tcsr-v1-6-cd7e6648c64f@oss.qualcomm.com>
 <sxjrbxwi64ky6dcntpnnbi3y5ujtssz7uno22xiwiqjdhp7rxi@b2nsnmb74vnb>
 <270589cf-383c-4062-baad-d232f7eef3d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <270589cf-383c-4062-baad-d232f7eef3d5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=6994596f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=OsKXUHKqkhwHkHYPZh4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OSBTYWx0ZWRfXxq1/0nAQpd0U
 vPbqKDgjoeuH/PBlaBU1QI+Ga7QWblXQUoZK9i4J1nRJ1lyKuzDMc3Uls+DtQ8Y8G5BNsFVzGtl
 i/tqQwikncC3FpMf1c+a2/lhNdIzejEIsSK2FAJnPgl/7oGQ1imj3yyztJBD4RAkOLLHPrlmM1l
 yGzBh8zkzAhblm8tL4XLtSrmX93tAKQXvv2MmmQSb6gPWBQOpnTpzj/WDrsnxw198stG6uNyRIN
 jXsUR4ByAxbVXKGLDdgUXR+sMSULunCiFkEUZBa/pb1I7MoXAdbqygqYREVhBxqxcGKKnzG5StD
 rpak1tIOe5zuBSBjPuoQSHeBJMlC5n20ABLcZ9NC40w8Qh7UXss4feLZ7vqyftItIJG1ZCHnuJS
 T3tbSjtdmkzDaqug9ttzSbkZXq59UMG8i0OvojM2rdDBjGB/1fqERlb+/Ovz1LC0Pp9kJtB5LX5
 OA3SV0fkiTamNPl5w9A==
X-Proofpoint-GUID: VZV9i-aJRoYUcy--MTNwHtQMvBHAyxWA
X-Proofpoint-ORIG-GUID: VZV9i-aJRoYUcy--MTNwHtQMvBHAyxWA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170099

On 26-02-17 12:50:50, Konrad Dybcio wrote:
> On 2/17/26 12:48 PM, Abel Vesa wrote:
> > On 26-02-02 15:57:38, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> This is now handled from within the pinctrl subsystem, since there is
> >> no "CC" block inside SM8750's TCSR, as the corresponding hardware is
> >> present within TLMM. Remove the leftovers.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > So bindings remain in then...
> 
> Yes, to limit the explosiveness I decided to reuse the existing
> ones.. I think that's the reasonable way to go

Yeah, realized that after having another look.

Good work.
