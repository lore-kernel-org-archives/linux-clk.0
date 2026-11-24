Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550506;
	b=WM6g94JeAwLKD4ocQQCrKEpWCKwTvMCwMblCk1aHbfyRUL5HMic2agS7oi6VjpjW5LnH
	 kgn2gVNh1m+UFAGMnZ7RHgt7oI1x6PuvFuH/C8x7lWPrnbbqwfTt3ZRaCamZzcSrlcee5
	 c95vulyalzT8XRnVecPke4x7tMBrNgO4Rbah/vsjPnZZkwhRDadUB1b7ciEstCvD29Y+i
	 MALdy5Nc5TMbhAe7z1Ci75sQ1b9pTBF41JHPkrggkhq62wtYW2QyeoKhPB3UuA+4aBsdN
	 o6UY5djBgybUjvPg/w43Rweshy4OUOWRQ+A8H1FguOI5DqvT2sBVG1JDjsQ5bMDTpsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550506;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1gByKWms90rx+ZYM2PzY3CprddTIzxOBqUOzZScJ+EU=;
	b=z1Qi+PqyVdxt5M8FkK8FzE4NWS7H5DF7ep3bLmvYh/UY8ahYIK5BXN5eJBBLxwDsi8ED
	 3lh3k6sDp0M2qNQulm6ej0PU6c6glnMC4ON9aPgcvt+7akNYRwIayJ0JohHtivaRkqMCx
	 lalPS70y9ZEyDmU/1W7iSpZX+jhD0Fd5jLLSxuNy3/GO9p5a9SBHnicHoj+6gieoUjAqM
	 LEYqyggaK9PYqMWtJW81Dp78dFUI7fAfnAXJ8JU3Qm/ifRnYj6PfW/Ti0R5LYDI0+H1w0
	 phmdKVOr39lwFa1Zzj5PUtEqYXgmtu7IizBJeJNnWBrouGukXg/orkaAzYC5m8C/cdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUBHRIjn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c1sBcqxf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE4C606A32E
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EE4C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUBHRIjn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c1sBcqxf
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXLj42306250
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1gByKWms90rx+ZYM2PzY3C
	prddTIzxOBqUOzZScJ+EU=; b=nUBHRIjn1pCmJwzztA1YcOY736l7TtuRsJ6kFb
	jrw2ctcgfWvZaGABsWaQT1OW5YcaZvIfaiDwWc2dItZAOwcUv8gwNzwNtM571xit
	Daj2q3OtyI+HafktVNFRLubsVdliReBEGj/E4ce0dz+Mrej8lBDfD8FhJTV7Y9oI
	JbkPSXZkjhH2n+0wRIQHO/fVx3ZCq0hJZeFWWECOeg6RIuvGymSp974It1srwNoR
	fTSAxLwrSfJwQsXyN4vuh4vYoXTTXhsebM+ASamBS8v04f7ooCf3arXUZ8545NWr
	ef2jmm91CyrkNS3UsqDjb4mCqlWBW3e3sZC3NGRaeyp3uaiA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxk9as1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 20:01:45 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c9e0f047a6so199493e0c.3
        for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 12:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550504; x=1796155304; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1gByKWms90rx+ZYM2PzY3CprddTIzxOBqUOzZScJ+EU=;
        b=c1sBcqxfc8K+YbKgB3enltRYc/kIOVUf3QXT6rBH0FCzSxahocnHtHegntvjSHBHUz
         xM69wBOCCuE2WyFyY/Fzr0+sxeEhSVLuGj3XLt3gyDreWp01MJwHo2amYH0ywHctiFzT
         2WLNmVLh3ab0bvdU6FypROZQQt4OLbpCBx7GkJfEaXnSpAXonbZJcEyEOiqE/1mtN4jZ
         QcArp/h3miNyQZhIIlAVxtJnPt3I6YGIMKmguuNGDNVbQz+lXQYVLitDu2TAlpI7K6z4
         fuB3P+LYfy7PYUnL+IUH4N/5OLRdMg2Vb3I9fisI9VuWAJXW2YAUzOKf9TnKSJcR2x7y
         ybKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550504; x=1796155304;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1gByKWms90rx+ZYM2PzY3CprddTIzxOBqUOzZScJ+EU=;
        b=fdk1PMZWngaPCSKUr1Tc88c5oqECX0i28zlrVHFd78LAn/T5CLyEt/X5+PO7Fi06az
         bYlMsmYu6W/7CO1XK/6xkfz4eC4BZoK2GkSlKNARPj3afPVrQrhxoD7CcW5d2P/NLs1f
         inob5HV7rD5sk2oXe9i59VHEGuLzE81qun5I0C2+Lamo8wVQRgov8mq+g68BaXdJe5J3
         eCqYineSRdkbm2zYysuMEC03jBD6OHKycjxRSTIhJLFKI8dRxhlXf/gvw4ggaf1WpPS6
         673qrY+zESSVYfjrYhV/JmbYpu/v8NHBtXpWduA6QI8kLUPUreNOtnW33Fcrf6F0Gn9p
         G5eg==
X-Forwarded-Encrypted: i=1; AL+hErGANrjvwQqxzeoYfJ7htmcdbLuD6bquxgSjsNp9D0er2X/ZCWhNrUpGaxTlomXi5zFh9mM5/90n1ho=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RXyEIf4rC2U2ZJLAuQdF5uGIW1KUpFEn7jPVpwmp/f0aT7Pci
	7wyMqKesEJEIeJiMwhgnJepGrBcUa78ymGUejG7H9obl13Qwiz/7Q/V8bvc3jmXz5Saxxxduuu3
	Hs8SRY5l67aBLZuHrIPlV23dxQW7jcKNQGgaspB2CbzvT7uIwZEmZJQaaNNLBmnU=
X-Gm-Gg: AZFdTZcbImedhUX3zF793QbQR98wwyM945+BVdZOIwgmUoxKXXO7u7F1KaIX1FGV4Bl
	3JBNW/U9Phk7Vz0JTX8F9tYlZ8hf54N59f/GJgKGLGIF5qOWb4hcf7vcM1zJ8o9vmsQn7aMK6ww
	lP34Ss0wrlVh+1ai8r63m1HMYnpfbFXJCNMXR7jZ5dA5ZOpkN9dRM8j60c9/OUZiG1rULpky/i6
	MvTvCdUpl6Wa7hDVo+Kk1yPXZK6F1c67gKt2ZPDdltowROksZ+msfyrTlZ+yntLvvwyA0PvkPIf
	akCr9qMp53XGXNXh7/Jdt1DeZVMherM04KMemh5LO0ggXSue7qwjevKyMEO6i5GOx2IFCEjBOWh
	NQ8O17VBLuWQ/0g6+BRNAbT5CewLLAQLycdHe6fZmczkNmc+Ki5bJUY0uAzwZ9nNTG4LPRPjJy1
	jUFbuZ7E8=
X-Received: by 2002:a05:6122:680f:20b0:5ec:b145:889a with SMTP id 71dfb90a1353d-5ee8aebba7amr10992354e0c.3.1795550502509;
        Tue, 24 Nov 2026 12:01:42 -0800 (PST)
X-Received: by 2002:a05:6122:680f:20b0:5ec:b145:889a with SMTP id 71dfb90a1353d-5ee8aebba7amr10991920e0c.3.1795550500218;
        Tue, 24 Nov 2026 12:01:40 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:39 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [RFC DNM PATCH 00/15] Qualcomm USB4 host router
Date: Tue, 24 Nov 2026 21:01:29 +0100
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABrtBWsC/yXMQQqDMBBA0avIrDuQjBJor1K6aOKknYIxZFIRx
 Ls31uX7i7+BchFWuHUbFF5EZU4N9tJBeD/Ti1HGZiBDzloasM5ZAiZeK57NOow64bRk9NfeGdP
 7kSJBO+TCUdb//f44rV//4VCPJez7D6+h/WN/AAAA
X-Change-ID: 20261124-topic-next-20261116-fsm-mvp-b936003bd2f2
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=7195;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=A+ZxrCHc+xf8sMBO+IHGTxF3X/zbPOdINNbdHlkOLNA=;
 b=5cbCykZEDXFsQZZ+XcavorGkQhh0sBNtwv2IC4avWJ42tQ1OxbK8wzU1ieoZNBVY+h/jWegS/
 EJ0dmLm80EQD/WK73n9pQNYozrvN9nj5js9NDwJ3v+pJ66kPr1hIS5F
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX7Us9D6TVQyE0
 46t+WDDuvY55By4kfpl57yZePQJ9l1+lEexxEsD2gL5MbyUL56OgxG4bGrDa3qmEDBXuzU6DQqb
 FFUsk33FrG1qk+7Z/RGupMi/xIz0zAjBUTlFz/5xJAtIt99FnMYZV4HCPgkkJO0w/EKBNHqMTbF
 B4b7eYQyXsnkUDN/hl+ccXAYkhA6JkQE6m10B1tRslifXN34dtRDc3dO+milzpevZlQbghF+Ldl
 aZIMW8tOOuq75xtUfxkKzbaPH25ki1rY+N3gUurig6zbtrJV/e/8nc0vbPKXHN2ZQFQTajwfdOh
 fZmthP+XBZY5bxMfaYXJNeIL/jBKv9NUJzkPzRt7H8mvbxf+CNN9KVO3PT4uNCLk5QRkKi4v1Ii
 Ib8fJb4yqnbsOH8xJDT48EDUSEjDHPslVsd3maAPW4aLqze6Ahvkgne5wIinagdSaJzJrTUr28L
 F6e5VlbYFBOuZOYO5/A==
X-Proofpoint-GUID: xEB8qDBBnGxbhEH78uOh2WU5V0ubv1sN
X-Proofpoint-ORIG-GUID: xEB8qDBBnGxbhEH78uOh2WU5V0ubv1sN
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b05ed29 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=Q-nnJTdTW8WZejlXziAA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX1/8qMw26Jleg
 GEGeDQtbF4o32po0abGXQ0GNSrpm9hID77cZRT2kcH5Gwmooz2Qv0PvZp1W73pCh8MkSdnhETNf
 PO0POxG6JXxrRSUEgpn8H7be14G0b2w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

This is an early RFC, mostly looking for acks/naks regarding the
bespoke power state machine and Type-C handling in qcom.c. This version
of the driver can power up the hardware, have it suspend/resume, but
notably not drive any tunnels (as that depends on dozens of patches to
other subsystems, many with shaky dependencies on the still-forming
usb4 dt-bindings [1]). Absolutely not intended for merging (unless you
want to take some of the intermediate tbt patches, Mika).
Speaking of dt-bindings, this posting comes with none, as it makes no
sense to waste maintainer time until that GitHub discussion is settled.

Said state machine is an attempt to tame the delicate clock setup,
which if we don't get perfectly right results in the machine hard-
crashing. More on that in the big comment at the top of the driver.

The Qualcomm USB4 host router is an in-house design, implementing a
standard NHI front-end with a lot of vendor glue. Because the USB, PCIe
and DP blocks live outside the subsystem (and are wholly disjoint), a
lot of elbow grease it required to have it all behave (similarly to the
Apple implementation, but with more manual clock control and firmware
handshakes). Native protocol controllers can only resume after the
router has re-enabled the links (which collides with today's notion of
nhi_resume re-enabling the tunnels), so that requires some
consideration (again, not included in this posting).

USB3 tunneling requires:
 * a bit in TCSR (tldr a syscon) to be toggled and the path to be
   enabled
 * a register set in DWC3 to work around an issue with the USB3 adapter
This is a fairly low-hanging fruit, but still depends on the bindings
to get the device link changes in within the USB subsystem.

PCIe tunneling requires:
 * a reset in the USB4 address space to be asserted
 * a number of additional settings on the RC side
 * standard PCIe hotplug otherwise works as expected
The link itself works without much effort. How we set up devlinks and
whether we can go forward with or dispose of the router's power state
machine will shape the suspend/resume handling there though.

DP tunneling requires:
 * handling a secondary mailbox within the USB4 subsystem (not
   included)
 * setting up the display crossbar/mux correctly (any of each routers'
   DP adapters can be muxed to any of the available DPTXes)
 * settings a couple registers in the DPTX
 * driving a secondary AUX bus from within USB4SS (the AUX controller
   in the DPTX is blissfully unaware about the existence of USB4, so
   the OS has to ping-pong between them at runtime..)
 * HPD management
Because of the muxing and runtime AUX switching, this requires
sizeable DRM changes, including Luca Ceresoli's work on bridge hotplug.

Additionally, the hardware is constructed such that the protocol
adapters need some of the native controllers' clocks and power domains
to be online, hence the odd DT references.

The uC doesn't implement a CM, it instead does some housekeeping
functions, but because it doesn't have a view directly into the SoC's
register space, it still requires a lot of OS coordination. It does
however take care of link establishment and some of the TBT-layer
chores (such as sending PERST# packets to PCIe adapters). It requires
loadable firmware which will be posted to linux-firmware soon.

This series runs as-is on a Glymur CRD board, minding its limited
usefulness given all of the above.

I know this series is not the entire feature set and that this was
promised quite some time ago now, but as I was humbled to learn,
sending 80G over a wire is no easy feat. I'm looking forward to
removing the remaining roadblocks and hopefully getting there in the
upcoming year. Please chime into the bindings discussion on GitHub if
you want to help there.

Dependencies:
 * https://lore.kernel.org/linux-arm-msm/20260409-topic-phy_fastclk-v1-1-6b4aaee56b90@oss.qualcomm.com/
 * https://lore.kernel.org/linux-arm-msm/20260928-topic-usb4phy-v6-1-815a73b063ef@oss.qualcomm.com/
 * https://lore.kernel.org/linux-arm-msm/20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com/
 * https://lore.kernel.org/linux-arm-msm/20261117-topic-pga_nousb4_glymur-v1-1-0ede74e620d0@oss.qualcomm.com/

The base commit (contrary to what b4 says, because of said
dependencies) is next-20261116.

[1] https://github.com/devicetree-org/dt-schema/pull/196

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (13):
      phy: qualcomm: qmp-combo: Add USB4 power_on/off to de/assert USB4 clamps
      soc: qcom: smem: Add and export qcom_smem_get_serial_no()
      clk: qcom: gcc-glymur: Don't poll the status bit of some USB4 clocks
      thunderbolt: nhi: Clear ring interrupts when not using MSI-X
      thunderbolt: nhi: Process ring completions in the threaded IRQ
      thunderbolt: nhi: Add pre_switch_suspend hook
      thunderbolt: nhi: Resume the domain if the NHI suspend op fails
      thunderbolt: nhi: Resume a runtime suspended NHI for system suspend
      thunderbolt: Raise TB_TIMEOUT to 500 ms
      [HACK] thunderbolt: Refuse to activate DP/USB3/PCIe tunnels
      thunderbolt: Introduce Qualcomm USB4 router driver
      arm64: dts: qcom: glymur: Add USB4 topology
      arm64: dts: qcom: glymur-crd: Enable the tertiary Type-C

Wesley Cheng (2):
      phy: qualcomm: qmp-combo: Add Glymur USB4v1 PHY sequences
      soc: qcom: pmic_glink_altmode: Enable TBT/USB4 negotiation

 arch/arm64/boot/dts/qcom/glymur-crd.dtsi         |  107 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi             |  703 ++++++-
 drivers/clk/qcom/gcc-glymur.c                    |   12 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c        |  321 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-dp-com-v3.h    |    1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h |   22 +
 drivers/soc/qcom/pmic_glink_altmode.c            |    5 +-
 drivers/soc/qcom/smem.c                          |   22 +
 drivers/thunderbolt/Kconfig                      |   13 +
 drivers/thunderbolt/Makefile                     |    3 +
 drivers/thunderbolt/eeprom.c                     |   17 -
 drivers/thunderbolt/nhi.c                        |  168 +-
 drivers/thunderbolt/nhi.h                        |    4 +-
 drivers/thunderbolt/pci.c                        |   15 +-
 drivers/thunderbolt/qcom.c                       | 2299 ++++++++++++++++++++++
 drivers/thunderbolt/qcom.h                       |  251 +++
 drivers/thunderbolt/switch.c                     |    4 +
 drivers/thunderbolt/tb.c                         |    2 +-
 drivers/thunderbolt/tb.h                         |   20 +
 drivers/thunderbolt/tb_regs.h                    |    3 +
 drivers/thunderbolt/tunnel.c                     |    2 +
 include/linux/soc/qcom/smem.h                    |    1 +
 include/linux/thunderbolt.h                      |    8 +-
 23 files changed, 3914 insertions(+), 89 deletions(-)
---
base-commit: 516d5c8f674bc07eb35c3b97fc21e79e41158dee
change-id: 20261124-topic-next-20261116-fsm-mvp-b936003bd2f2

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

