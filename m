Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461531;
	b=EWUYL/DlX9ADQ79qrLpaO4c7L/sxbWAhtMWQ0diHq1bfaFtbmKC2vNF3RklJgt7kua57
	 41uy8vtHtb0KLPpafU11Ez2U3PzgKvH6rM9s5WvaUhojlTLwDoPpwMujc8sSEWjC/MQFX
	 sDHBJXWUCJjfDsBhRQneCmyWK6Vu1uIYXdqCgombhGypzxtg1A4khWzXjzrvkd1T1lOpS
	 8cuCnLEGRxEy2451SewtRVjbOlfROEGK2nzE9BxFtd1+bHyIQPY/NjB4sUqjQU+hcT7eW
	 /6m8IKlJSV/RO6lsoJS6QS37LJqua0H9cW6oTObadKpsiEF5fhRTOOrKMn7qbGofMQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y805Ldq0zOs7VHrpsV5yAaD6RgPx1BBPdzqAj6Loazc=;
	b=getLo9OhCpllDQAqTWohfXfz447FHjux63BrIO9miI6QoW5Y4Iz2PYXod5twBdz+cTAJ
	 fIGUKSZwqmd8LIEotZCMN0vm6X/qTak0hfWAeyl6/JDJApBl3y0F5pkEYy0R0Peemygxg
	 f4mAV5WFQbc79PumA/el8EXuG8lJ3YfnoyXNp09WnsOV6d0nW4ND0XNANpmFyWO2PyRuE
	 rVswPRneRHGTusLhH2dYHt81Do6tK0PYH7e3D+i7n/4b0PDMTDRnDze1nQBiOo1X/EntY
	 qN96ZAeovT1xOpNuxK8x3PlK6eh1/eXd2npS2o7+BzDlkiM1SDpOJtunMb/TESv3VFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uzw1GTOv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SxTBbLJB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49467606A327
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49467606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uzw1GTOv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SxTBbLJB
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGucx2486557
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y805Ldq0zOs7VHrpsV5yAaD6
	RgPx1BBPdzqAj6Loazc=; b=Uzw1GTOvs71GjbbnZoQOslKHhOfzZgdwsQk7+dRY
	d8jYEw/EYA9+lqVBIXAIFxRIzyf5Yy/mfZGJe0CZVZ8Xv2Z2JKkYT9IXxaDPE/ER
	hWdV00C+bYN++LgxazNM1aBbiAyolUj/uEKcyDXN0vqzUx+vv0zhXsA4Fyp7OHfH
	3mrdFTBRVG/70UVForVLuCiNzbjQKOz5tmWtCbhh0ItuMKMhabtOIZlXLCXi3elO
	vN/KJ8htE0i1q56G2gph3oJit+LIqBLiJ1/9fs3SuuHocF0nWacg2kQU6p65Px1N
	/MDkQo2gVK6YnU05PTG7xL6ezz6lRfrrJDGoyt/gSBMSYA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy033uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:18:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9210ec7cb34so99564806d6.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461528; x=1796066328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y805Ldq0zOs7VHrpsV5yAaD6RgPx1BBPdzqAj6Loazc=;
        b=SxTBbLJBGFViykrJ8MrtAkKFQNyJwUXCO+rMKjQeuGjhLYs1+TlsRnBX1UvXLCm58n
         /fOqRxAS36ZYr3OJGWds7mWPQb19gKrnHrkh3j9t4lId3h+/KGIQgf5bAgKV2vsg3QeB
         OtJHmzR9tPbNIqppQo38M2GchJxjWnAdlhYgSsHg+Lk11y2TjrOmz0nwB1t+MDzpsEUZ
         ADJ8B1nWC1MkGSIpV6HfmMv9rQaDJCVjnrf9tBByeNPGY2ybGkWVjzm6Tw+YmyLGbcff
         6DiV1zIgkdyTdtp/7sKbeeZln7EOcerxeVyVvbZcN4ucVQhKrVJOoCMR66dpb//kvCoc
         vb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461528; x=1796066328;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y805Ldq0zOs7VHrpsV5yAaD6RgPx1BBPdzqAj6Loazc=;
        b=Ov8mo3rRSCeiQer3Vm5DLshULO9k75HAoNaDVq/oNi8ZYXBF317yJe86FdgeVwxr/C
         PJSdq8ZmfThghQst64UPKVuznUyf3XL9/ay8B4GchOt1IajxJ39V3dRBWRTtWPWjhibY
         QVgWjSZ/q4l/mhUvzt48y5YYHlLrdQ+k+l82gM2+/3kiEZ52mpmRuOyC2LS36Ys1XaND
         uQ6Fc5lnT7feupmSc0gMy2NP3KxS7XVGF0NGrLjV6HQtF596SSjDqMAWAnYrgOvJ2ySW
         eM2IldjpHeQwA3KSYBcf8Ep1HQwYJAtozmP2gVFDGajwaK7Ehna6LFUuJFg+wyDz5ZLv
         mNvQ==
X-Forwarded-Encrypted: i=1; AL+hErF2EQXlQXR1YuoGMi5JP8TeVWCfZ0AkBX3UJY5Lh+BI3HWeTBX9ey37csPm7UnbC4zmCvv2Z8WjV6M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yfglHsy/bKSaexhpbqpzqEyLd9KdWdCWRNmmHFmddrpYBzcRF
	hi+vtjyMfGSEyrx1HSHIjJhQLCiygH8KQLEvtSeNDCBtFpvmUzw5zLoh8pc5c2nIo7FovXU3ll/
	q9hP8BYq1fNNwi937RuvTi9iDV3RAsbDXPpLU23jTUVz0LLctTP2g/WB093cJF4A=
X-Gm-Gg: AZFdTZcdg2yp90NYoUZSNpUj370NJAOHeO/kv2MpFTeoL2lwcfMp/bpmwWMpQSz6Mv/
	w1R4b6pULJOxtxUqrlPWo/oVlVnZpfseloKXHu105yxqpttDam7gPbi4mEM6y24UQUOFYcmplRP
	TYailEzbheF872kB4+97KBkuvXZtE2KbhwyrDGXngvbK9oSXVMd6/WPpRgYF+Pf+tnUqSrfkNXY
	osL+mYpdzzCYF0Kiig6s0wYWhfS+jUGF6fv4QosGB5vmFmJrAeQ+IX9t1NkqP+VT5ek6w5UVdJo
	RqPELtRagZb43qwy14SIFA1QshruIeX6oJ3VXpw57toxHBtOjTHq2OtWwRehnbgML03C6laXiZ7
	27WQhl/4H0VOEXuNqcUYQLklHHWlp3M0wwJUOqdNPbUryqobyWOdhL/EZNAoznNJW
X-Received: by 2002:a05:620a:2550:b0:949:70ec:7e98 with SMTP id af79cd13be357-949baa13290mr2228550885a.40.1795461528424;
        Mon, 23 Nov 2026 11:18:48 -0800 (PST)
X-Received: by 2002:a05:620a:2550:b0:949:70ec:7e98 with SMTP id af79cd13be357-949baa13290mr2228543685a.40.1795461527751;
        Mon, 23 Nov 2026 11:18:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm144885285e9.0.2026.11.23.11.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:18:47 -0800 (PST)
Date: Mon, 23 Nov 2026 21:18:45 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hikmah Gumelar <hikmahgumelar@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v3 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src
 100MHz parent
Message-ID: <qdf5ekjjakcfjc7cpaz7zrsn3a6krlkktsygr4lvsunmrxyku4@cjbey6jruzhr>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-2-hikmahgumelar@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123152722.168879-2-hikmahgumelar@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX1t2APS6Ao/QG
 zrL13V3XUAdmI1bHSEYPyJXGlkEPMJ1XZihdCvgPW5F9xCpfPGy3r/lXQj9UmBmja9TUXvIUtq+
 uSKYFOlu1CtaPyA6XZqZShWEFx1QpHzRksQ5CXGAgpCWf17AXD7LBhrw3mjHOZ+Ddgldavez84x
 uLf9dWZrNF3GwQ7XZP+CkBfx1rXN1FjCXUq+rRIGKKNTYnLiVhugtJpcCTqqm6AoK/Yh2JYf7fP
 cyslImBnTOByqugGz8xxhPWF3/MIR03DADG8MG5UKARfBaTJ63NTkHDmFdRqYzMT7fwKtFrL8YB
 8CsThHzM3RCD7E2J/9nZTzH0LisdGiaEVj8ZQObQijEN0QaNtCLLIy8p7Vi2P1AHPsmiB3Ptwy+
 6hOnPFArQ6ehOEYsSWEQlcWKblyxA9b8lDF+dhqloeHlw6921lPC2h29ivnOKBzXgNXFvyDV0hi
 SJsC0sj86ckGxYvLxjg==
X-Proofpoint-ORIG-GUID: wsR8IvIzxDShDu62lJ2SbrhX_LkIq0fZ
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b049199 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=ET__IwHBT81aRugf-_kA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: wsR8IvIzxDShDu62lJ2SbrhX_LkIq0fZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfXyQXxcBoCa8Lz
 Y5ZpTADvukyVklOlL1IIhQGZcq9Z+8ge+HxMKo57U6djka1aBrLLI+NFhhA91qkiOrTgVOYxn7B
 FDpw54lXDBhRmDRdCS1j1I4Jf49af2o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230076

On 26-11-23 22:27:16, Hikmah Gumelar wrote:
> The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2 with a divider of 4, which leaves gcc_camss_csi0phytimer_clk stuck off on MSM8953 platforms such as Xiaomi Mi A1 (tissot).
> 
> Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
> Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>

Please read through this before sending other patches:

https://docs.kernel.org/process/submitting-patches.html
