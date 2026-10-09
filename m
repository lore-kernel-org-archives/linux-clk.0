Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8561250AC29
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 18:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570083; cv=none; b=VGkvl5Ocdqop6W2AW0IiLO/Zm4aT8xjsSpouG+aZEVjogZxw3+Hs5D2GZJwFTk8NgkrKYtGcsBR3aeQTc0DtU0jwR6teomMuPeYZCr6uh4MbWT9CvIqeVW+dgWMJGi4qt/Z0JW3dVxDndkzhRca3IMAsObiL2xlcQsaCX/HObe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570083; c=relaxed/simple;
	bh=QG/xfKAg3z8PmN9x8CvACM8+/Ordyxc/n7oiA43oTrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WsG/yOWV83Z4PkuUtXgSKLVJnV/bP+SlD7h6yxabeaKT3gKIqEcysoXCR6nxLx6irxaOMYn6CSPqXc5XKLb+8ctfzBC5loGZ6GoY87cDse0hoq+kMxLykjyxh6PaqFAviz7v9PXIZH4qEo/iaGlVKD7o2gkKdPtIZREwZcCGsHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c1HW3RSG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQ2HHLRT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c1HW3RSG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQ2HHLRT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZRqY1620126
	for <linux-clk@vger.kernel.org>; Fri, 9 Oct 2026 18:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+W0zAIuAAPdlKzcr9M8PXjcn
	x9tgfmOxwCMvNLyqNQ0=; b=c1HW3RSGsu7x05u0+h05lOhk6Sss72g2ikLekh6l
	XoPO/t1I8i1DQAkHh76kA270x1q4+PdSeNnt2h7Iko0l29d/14hEzbfPUwTZpuLy
	uJj1AhLhQrQONHfQMvCfCqipW898p/N9kUvKFPP/bgd12K6WmxYQehVzplfuQPyn
	cg8VBRjvL8ZECQmsiV9/yT7PXZ8W8j1WbiEI9bgYgduon8XTogX5kJEqCXCbpH8Z
	bBUsfv8KYzwsahJAZzIK4ZyArtWEzWoYiFw3Q8lbQJHViJDr3kEe0y1IDygG3M1O
	85LRjaMp6VZzflyEe4K1brHGEpPXKHmiONkOE+4rknjZ2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t705td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 18:21:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso938597485a.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 11:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791570079; x=1792174879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+W0zAIuAAPdlKzcr9M8PXjcnx9tgfmOxwCMvNLyqNQ0=;
        b=NQ2HHLRTF8+az5hUtlQ1i0vMsqrX8bay1dqv7VHwT+KQJqhEvoGbQ2DIpuB7VWc3hh
         U2CW5TiJRemT4dUxn2fKsUiDkDPNipbJ6Hz7mtsLSVtuB2xPUsX7NGi3AqZuMjRLWZsq
         OA8swLUjvaDUcL8k6nKzhzBtVYoNOpo+6a1eyk653KP+po7vyscgJgf/IJzvJEaFnlJY
         kgpe7XYfMroEaYeTMZfDGbhCdzBOv5ltt0qKrBzsXYcLQgavAZN3V48kqZZmC1plvSHe
         Kb4eAp5Chs7f1slUg9aC0auXAkQG+KjRdX5RTdeHFwpeyIpQ2aE2lVBVrbn+OJNVfrha
         2NMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570079; x=1792174879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+W0zAIuAAPdlKzcr9M8PXjcnx9tgfmOxwCMvNLyqNQ0=;
        b=2tLop2dF/A5+5oBYEgSilACjnhAgzmSaB42ZueqnxuQ6coDTYiGVaoHRsohGgo7phN
         j7475YiCZFC1yqzO4mdmF0Hd/wL7QnTvYUd0BMZMxIrQTSZSW1oY03LqNDuas8vd29m/
         dEBiinO78hs5Nrin5/Our/hTgG+HQzcncdzuZ00CupYQ9y4Z8AyinhJU8ci7SBTMqQEC
         5XN0BBasU4AIZZ1NaC8sDPgaH432y/J/CKcsjYk2ZeEGioEdQWJKm830aXPcQDQYRTwn
         AoObPpvisOW3HL3UYyTGPuYmtxn+PsbxmzrP8OpXgx0g57pLbyp7vOPER98UhfUoUvaC
         xBkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPBItnhREgSTGdfzDc/IHKTpfwFBLkRaT+DnKER3gNhwtguKlLADI+iVcMz9e8lDfcF00Lo76mbT8=@vger.kernel.org
X-Gm-Message-State: AFuF++kmbF8gfFJ4DE/dhbENv9ze7bMzZ1Um0OgclZcbUa3f5rL0uf0U
	u6drfJc4wu/JsHVpHEXnNuARQ+JpqAwBi1uO3drndxGinOSGKY4Z0w+S0ibU+KfdTMzZP2OStut
	SI4fzCC3tgJ26I/pxFStfATPNAjLjX1euTwFMDrF9rfP54BVxakh3TQk7GS/Z8KA=
X-Gm-Gg: AYBFou3jKs2Q3AbIAPAinHMSBrSNbKsW6TUSUQ6dukYIrRZQiomNUOc4+3tDashh7F1
	srt9mULaWw/28GaHpri/fRh9ns9UrGwMAloFAu8kemjIBCAIjYFC/B/Vo4DZaIBihrBctydsOel
	gUXkES36vJAUelnTZDxxY8+ybOFnc91YvZxJUR0NlfScgjrB6Juyhb5ScNk1LkmO37YCCzzy8Vo
	oOES2A71bH22o2BWQ1fPeibUkiRmkjCkd1QyGZXIAbBASw8J1JKs7pSuqMDo2YSnLOR+oI53Fyp
	AILqiNJxM9lbWNaVFyogtRS10JZsnUrOYJrkJxiNPmFr4b5CQy/piNRSVMwjVCTF4V2ATOLIgng
	5zb9gTrlLnstTtXs=
X-Received: by 2002:a05:620a:2b87:b0:93e:c12c:43f9 with SMTP id af79cd13be357-93ec12caf14mr315313185a.70.1791570078534;
        Fri, 09 Oct 2026 11:21:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2b87:b0:93e:c12c:43f9 with SMTP id af79cd13be357-93ec12caf14mr315308185a.70.1791570077935;
        Fri, 09 Oct 2026 11:21:17 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9463a9dsm5307067f8f.6.2026.10.09.11.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:21:17 -0700 (PDT)
Date: Fri, 9 Oct 2026 21:21:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: fabricioakio@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: mmcc-sdm660: Do not keep the video core clock
 always on
Message-ID: <urlsho4oj4uxzrkqgsaimw44v52zcr7h4oocpju4gwgkcqtapc@zk4smuejtnsa>
References: <20261008-mmcc-sdm660-video-core-v1-1-3a772ad6a436@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-mmcc-sdm660-video-core-v1-1-3a772ad6a436@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3MyBTYWx0ZWRfX21UbJ8+19nyi
 fqt9muZs3LbPebMm1yC5L63xw59zj2ejXva+5HixMN+eYXYKici4NYskrL+airAWB0eM0GeKXke
 AIWTG7nhY8Dxn8hTdQ7w/6HRFZb9pjGn4l7I0qGvusCGjPytLit+Z9lnxFlUHZtkmrzezqnfEFv
 73Tn1IgQWk3L2PR3HVnls1BROfov7e/OeJAFj3ZkBvAycGVLPSgKyUtdg5mEsENLRShdT0ngkSZ
 GSVWOEVpXPIQh+Duhe5IqL1yducSvZOcH5LxWsne1FcSAP3MJItXv7VvDP00GWWwu78waQEKYtK
 ozrL5a4dDN0GYYh1gH51IGAdX/DKvwbMZkS30ox0Karoa2hB695mPpNA6Xi1JiL/EDrs0Y/vRFm
 B5I9MeGt28YEY9HcGp2pMEPrPo3CB3BNHZ7BpP/tnqfFi6NSwA1iYlkEQwh589zlNk2Vd8XHU6K
 Bd6pQO1OgrfGrko8QJg==
X-Authority-Analysis: v=2.4 cv=Zt94uN7G c=1 sm=1 tr=0 ts=6ac9309f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=jEBpRxE4x8LBKc-QtTsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3MyBTYWx0ZWRfXyoMmR92biI4F
 +6Q/Y7h5LnPVKnYR0tAheUNMDp7pCNCC6XVu1DGu37KDFNbGUniH1GB9lfULqZy5ow4iQ2z9/bt
 v61/TREQYuBMzwdIaUBk1mzAId2HyoU=
X-Proofpoint-GUID: O_Vz5AOc8rB9aZ-Xz4B8dfHJvxkqbk3r
X-Proofpoint-ORIG-GUID: O_Vz5AOc8rB9aZ-Xz4B8dfHJvxkqbk3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090073

On 26-10-08 18:49:18, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> video_core_clk_src is marked CLK_IS_CRITICAL, so it is kept prepared and
> enabled from boot, and with it its parent XO, which the RPM then can
> never shut down. Nothing records why: the clock only feeds the video
> codec, whose driver enables the core clock it needs, and the same clock
> is not critical on MSM8996 or MSM8998.
> 
> Drop the flag.
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
