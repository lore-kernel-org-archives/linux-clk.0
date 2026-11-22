Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795352979;
	b=RtOdKIMUUgrcXmxI3csRBVY3/3QuouR7Gq2kdur/T2E3iD9mpXNlItWgylupATORu1Th
	 IFvhlGTc1lw3uDRTmQtr9x/9V7aqOQPS4vV98OWxAMRJjvT8w740ExExjMctt/oHDObZx
	 GWh4pf77N7g2nSYLk44+wRASKUU55Rzf5NQx2vgAGcl8grJCGDZnhSPlqXw1B25vOF7eM
	 qJ+AZ2hys0eKeAYXCEZRYDeBLcGsbvMAIyCeFdT2LOM2hnwkQl+GSPjqA3UhO5fa99/EC
	 Djqa7D1XaLbyVGeipg6A28Mfmu3Qag0OBNaOU46skKu3AOlrApiH2c2WQQ3X0sN+wYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352979;
	h=Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/fn469lJY/4T2wVEcQuW9uMC2HWP32vpzmPRgArSkk4=;
	b=VN7/dVQBbFD2f4gGlRahrv8IdfzKHvxZsC900uLNIbHZrSNZU28leGjGfMNKiWD3UjwV
	 Sksgk/ogqJUAfuuzJXJGq1JV2GXXJ8VVP/4Mt/eT3IXBHEgd/9dvmUbEQLTQ3F+TMxB6+
	 QH6kwQInD36GCI6tFSTEw7CSoeDLIXKh7Sd2CTSmRbfDN1kTtzp8HGXBSWCzpInSrBMRR
	 2GWq741LM6MVnoTilPp5zxq5ckgnjAyJd6CyDdLI7gmJgRD6GL4OF82rGkTtNdN/Yq+UK
	 1kFRMxsDv7lMdv5eXgZ+UUTYQ795Q5nc+DA9fagLG/arqfBH0ETqhpDapDYvx1wrmTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A85606A32A;
	Sun, 22 Nov 2026 13:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2851F000D0;
	Sun, 22 Nov 2026 13:09:38 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Unify KConfig choices between clk, pinctrl
 and interconnect
Date: Sun, 22 Nov 2026 14:09:23 +0100
Message-Id: <20261122-qcom-kconfig-unify-v1-0-6abaa7faf1c9@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTuJHYIGrmJcSPmLA6HVVoiGc
 HeqLr/FeyslREWiplgpYtGkwWeYQ0H2fvM9WLtskqOcjBHDTxsmHm3wTnuevboPowSqqq3lXAv
 l8BHh9P2bXq5/p7kdYF/fE23bDo3d7/N2AAAA
X-Change-ID: 20261121-qcom-kconfig-unify-e3ee55b92792
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=959;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VgpySxkBTf1+rx0Mr15qQw05wqeB8dTLHx+siB/m64I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAumH1G1RiIKH2kEcurkNrZWGHpg8jOTWFb6Xe
 t6iHp0pR8CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawLphwAKCRDBN2bmhouD
 10tfEACVIScDpFaP96gvjCkX8AH37OUfvE1X/SWmqgWHmJPmkUjpW3LoB8KnEclDk3ijQhnaCNs
 OMVJRFqbi88J/AQIkNFIc21Mtw7KZDlkwZxWE5hiJYBM9Xa35LPGGoJTWcsJaFPea9BpMnj612j
 qWYZ0+eE5S/4itW6j5Szsv1zQbTtpgvJXDZhnQtnorLfd7RD/GUe6HOAcqOHD8qWdz1O9OlgOA1
 h8FHCt0rEUPXgQd7W4MbjpiYtMliIzPs/wOd9XTLbMnt0MeUK9MinFMrJdEXPiiC1nSNBaEwgMZ
 ziis0C3n9bkrS9FiRwI0yi+ict4fll+RQyct1rw4nQtu4QRjAiCiRaKizJVv4HNAn/jIsfzr7oS
 ybikUYuh38YaZ0KMUUXSeOTxeOsvwG+T1V6Nlp7MmswvqpeSy4fEiiinkhLZ7KWAgqKBG42zqKj
 FDmwnlO/uwxt9MNHNRRetJp7V8bboYIpNGI7gUc2tAsT8fEqs1nzKtFLiDb5/Cg/erHnisHkGe9
 fLbL5FKMzgMYRcoAeq0/kKZJ7XLsMnL+mRIa5lIVn4tT0wxvRiRSxkgeRwB4nEYGYsmxyasaRgX
 n1kTpUT5gCxwqsSBWY/Z68O8MV+hqREzXrk5evlGZm5JYIrzdmhZ5Tdfbl8BYTTw2OEHH2OWW65
 J3lfOG2AkUEeJ7Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Recent commits adding defaults to clock, pinctrl and interconnect
drivers left a options inconsistent between them, e.g. SDX65 clock
driver not enabled by default but its pin controller enabled. This
should be a consistent choice - we want by default all critical drivers
enabled.

There will be separate patches for pinctrl and interconnect.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      clk: qcom: Enable MSM8917 GCC by default
      clk: qcom: Consistently enable MSM8939, MDM9615, SAR2130P and SDX65
      clk: qcom: Drop redundant ARM and ARM64 dependency on IPQ_GCC_5018
      clk: qcom: Consistently handle MSM8996 and SAR2130P

 drivers/clk/qcom/Kconfig | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)
---
base-commit: ddeca928793056a8ffc0e3e107722c25e1836eac
change-id: 20261121-qcom-kconfig-unify-e3ee55b92792

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

