Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513766;
	b=qIloftfc+RZDV+UbGMWTLNFqFceG6UFgdZtn9VdOjwqmMG1TDrJ72E7C/GeGDDgAW2wq
	 gKvC9D54Clvd4e1bQ9LKSjXphbK8T+iti+kxBeNfCJcP+nlXuoJpp0P5hb43pAmU5MStV
	 olEPg0ifgySVUS2LjmgA+KXWayEfJ5QVnP4dkeH7BESGcnCSub05srE/SrnuQdaa2ocEm
	 22lmaoj0lp2Ujjin0XWR+jLFQgY7tOc9ublUMgRsPB0YHZXcRskIQMfOcqf62qRgUemvY
	 FB6ZaiYB2CUReWBrlpVAXu4IcOJNtxTEjlTVlTT4pzeGJLoFg8Wd/23N+9Ea3Z1p1Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513766;
	h=DMARC-Filter:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=DUmtXlBcUHxjuMy3pZwIv0Pxibvn86NWPT0SNRgHh7Y=;
	b=s7G6+8hRx3jYjQ52kf9SdCFpjRK7YNVcpuK0qm22vqmutQ0IjvJnkl7AZ7l4Ievy5dd5
	 2BJ9BMvch09aONP4vIdvGgqMkXF93dZhsUVXggChTBB9DOgha9paMGdBGrv+KQklVFLVI
	 8Em39BRq7hFA+065mCCKivM1nrxFenQlN2+k/LSJlhhqA1IKDi1g3XGzJqp07XbEMu1kk
	 cq5t+SDCZV2eF9DcgX9/79BacsRHOnRufWkKqOTolkx+Hf0e4yN32muynXr3NarQNWCwj
	 k64ECTl4IcW0S0wMWNImvujHmpVXpDoAiYoQ2Bm2DtOAh7f31hFhJyprxgrEjIJI+IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A3B606A863;
	Tue, 24 Nov 2026 09:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98A3B606A863
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id 7C0D8859;
	Tue, 24 Nov 2026 15:19:14 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Subject: [PATCH 0/4] Add Qualcomm Netrani clock support
Date: Tue, 24 Nov 2026 17:48:19 +0800
Message-Id: <20261124-netrani-clock-v1-v1-0-ce10cedbfa4b@krgm.moe>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB1whlDUq5QukjitoyVKoiKId
 2+sy7f4/4AkUSVBWxwQZdOkU8igsgDf2/AR1C4buOIHERsMskQbFP138iNuhIYaa5ir2pGDnM1
 R3rr/l8/X7bS6QfxyfeA8f2yFkkB0AAAA
X-Change-ID: 20261124-netrani-clock-v1-419a42208b1b
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=gVidxT+fRI9ihNdaHD06iYqbIJHjmRL0fjdZmrbKE6o=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrBV13fVTeJUAng6aeUTTFXnhVF9BT7NBSijFLn
 M2dnfeMveyJAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawVddxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmPrzQwAhv/7s2ExCZq9D2aFAA12fo7cu6L40sZ
 IFze5uBj5bAiSW2olVjPmOafrGRaO3ix88uAZwm+i0+7Qn8fWX//JeEZeoe5L/d74cYojDiht+H
 pfJ3Dslhq+TEOyQTn8aH55ArEAgZOUaDyr3nto34pnKRjy92lLwhP3UBkUfPu+sD/8IMf/pKUEc
 26NPEpkuVO+HhTjHDyy3Pto59pngaSnaCMKTB0U4VzuaoNl5m4PKxzn4LsNeuVZzHYlk1N3a7i4
 JHenV5+UuYiVhiTH61nuf7WIadwZSBwodVu39AnXdGrUrvqmOyFAPY3cgmi343Xycgb8GnBB2YG
 JtVFrW5CUc+c/sppEUJKWSq4sbWJGJiVeYWtXt8eetse2o7I11cvvKtQ+LflRly+m+vu+oNxBkd
 8yc4au1oVDx8P71gzyJF23fDhIkGUOcjGmZsPlsunNAJYnBnS7auQ/Cl5n8xRNhVU0Vs2iMqZ2m
 iDQ4kdud0toXCUXY6KLOa496ZCkiE96
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Add the RPMh clock data, GCC binding and GCC driver for Qualcomm
Netrani (SM7435). The implementation follows the existing Qualcomm clock
controller infrastructure.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
SignKirigami (4):
      dt-bindings: clock: Add Qualcomm Netrani GCC
      clk: qcom: Add the Netrani global clock controller
      dt-bindings: clock: Add Netrani RPMh clocks
      clk: qcom: rpmh: Add Netrani clock resources

 .../bindings/clock/qcom,netrani-gcc.yaml           |   77 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |   11 +
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-rpmh.c                        |   22 +
 drivers/clk/qcom/gcc-netrani.c                     | 2833 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,netrani-gcc.h       |  184 ++
 7 files changed, 3139 insertions(+)
---
base-commit: ef922b721a5e99348fc1f5801fdeb427ee14ee9f
change-id: 20261124-netrani-clock-v1-419a42208b1b

Best regards,
--  
SignKirigami <prcups@krgm.moe>

