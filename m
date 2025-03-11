Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDD822A819
	for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 09:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741686119; cv=none; b=hj0DVL9PJN2bmpeOfExPJ8WQJDOPLQGSoQ32T8KLu9Kl7SP4MsqH9HiHC45NOi+zI9OL9yKQTe2lbpr7rzyWEMl5Cn3mObqz3caZ4VPm34f2d2vj1tne14jukHfPyrJlnhuPdspxBIcq1GpUXl9dWihclwswMgPXakasrFlUVlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741686119; c=relaxed/simple;
	bh=03Gv4s873UjI+xmcPzGntYsW1I0NmUQapHmHTtq49bk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EcROcIj10o+iHeqiZXfCAD9o+j06+qWldgmHECQscHCvcvmA0bjx/bna+CRzUTiWd+CSvmA33dxD9423IvcKqC4dQVeWWNeG8MNPP4qzPqwZardTOe8SklUeLUAOHTwp50Ajy0dpVoj6cwtrKL0T95r1BwFbwfSal1wCpFoi2yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v6Q5ovYJ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v6Q5ovYJ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-390e3b3d3f4so2485136f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 02:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741686116; x=1742290916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FLzoATiFKr1B8iCGXJt123FaClKzJD6A9v143qispxo=;
        b=v6Q5ovYJzPunj8VY7wwMWFl8qhj/RaI4OuoDQg9mfPiIHThZgkRU6NB1HMmhsx5E5i
         lFsQRp45fFGyQDvo8zrrpjlsNB9wbTaoeE0kPWefw5CpkZFiAjorwSmx1YEVqT31zjYp
         Z9VyxR14DoYH+dfJJe8lg0yuGVZQKpTQhS7nNB+m9TcxBcDc+KfYymka5QNS0nLI4THl
         +MfzZkczQHCwpK2aqk2J+tMJvVXM81aCCEOtk3rE0YqfjV9lTXuRdARSSf7k7uF4tIiS
         bB/+/7S5QKh/uM16F6gAQYAC3GeMmFWnJ3ZDN+hXYxZ6RTAF51XraOCVhpsL1nMbpxKi
         IS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741686116; x=1742290916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLzoATiFKr1B8iCGXJt123FaClKzJD6A9v143qispxo=;
        b=GbuHwCGDroEarYsbrrLumXSi6bvogo/nC4OqXylqouerMZlbkeTwpQ5LNIKzD5i5pC
         cmflwslHDrtmIQx759m88AZc5c6+QyQiqLDGkJtVRtQLRerEH8ArFFAKKNPkB4StWOZf
         Dnp9sS3eGQ8E/vZ7iYQWeYasSLN3DvgE310ouBRiryLplIzZxlgnApspW444Gb2+Imlo
         7Z4lX9FwsP8hOfpi0b8qmwczfnZd651BfrkqHVUoCYEiJGx4sAffzBESoa47JXHNUq0b
         YO04IeD8lZnOoAorpO3fEJTut+QJDvAYnibObSPnh4TbRwc6jhbNeQQ8uBTPrr5zkpye
         CGLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKfvHxuLLMcJSN8fmccnEzaKcM8egaynQcqHLIuv5YiWkMUu2iVDKgFF1fkWe9ZQmIhPKR/+g8Gzg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Z15U7G54XhSjIe5j6Bcq36XeW9bEGI6qGLxCSa/WotceHoYw
	W52o3dSAnjH+HGI4+3iGlMfCjTvbw64PWky4a9RYOG8ONgQIrujn656apeEhLRr1QddHdRK/HgY
	P
X-Gm-Gg: ASbGncv4lYE7PhoAgTdy1TBnb78vWpnPfaDIixVg6oSyX9/d/pgzcvPiXcg3Zo+n4/l
	SSNGzQ9mkfSEyYq3OhfMfJfTFU6ciUF3gAStV0SdU2Zn5h9ikTPJuZj0WSQXSJV17IJOWB0Pwvt
	1gQqhnsu3aqYioupOGbJfGMnSSFmUQrOZaQcLbm5r8YFqS/Q8FqmWYyG0OR8hMgFN67xe/tBQX3
	Ik8oXu3e8pveCycUToNYshbggMKEUKwusKDbORfz/z719nNgd5l2mXUvzWsmIITZENoFJ8QCSlD
	Qqh8pp3KdvlDoxiMyyN81HU6CTCYuLQOe/k8CA8aMNE=
X-Google-Smtp-Source: AGHT+IEdiLqVceheU3laOr68GSrQpdRVp3WLSzOWbWgbN9P+MXJtFbu6q15juGPjGglXL1E+FUFlQQ==
X-Received: by 2002:a05:6000:2c7:b0:38f:451b:653c with SMTP id ffacd0b85a97d-39132d77a3bmr10037297f8f.7.1741686116146;
        Tue, 11 Mar 2025 02:41:56 -0700 (PDT)
Received: from hackbox.lan ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdb9sm17427957f8f.27.2025.03.11.02.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 02:41:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.15
Date: Tue, 11 Mar 2025 11:41:40 +0200
Message-Id: <20250311094140.722154-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.15

for you to fetch changes up to 06a61b5cb6a8638fa8823cd09b17233b29696fa2:

  clk: imx8mp: inform CCF of maximum frequency of clocks (2025-03-03 19:02:15 +0200)

----------------------------------------------------------------
i.MX clock changes for 6.15

- Add missing AXI clock to the i.MX8MP AUDIOMIX in dt-bindings schema.
- Fix DSP and OCRAM_A parent clocks in i.MX8MP AUDIOMIX clock provider.
- Document vendor specific operating-mode property in i.MX8M clock
  provider dt-bindings schema.
- Apply overdrive/nominal constraints based on DT property in i.MX8MP
  clock provider.

----------------------------------------------------------------
Ahmad Fatoum (2):
      dt-bindings: clock: imx8m: document nominal/overdrive properties
      clk: imx8mp: inform CCF of maximum frequency of clocks

Laurentiu Mihalcea (2):
      dt-bindings: clock: imx8mp: add axi clock
      clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents

 .../devicetree/bindings/clock/imx8m-clock.yaml     |   8 ++
 .../devicetree/bindings/clock/imx8mp-audiomix.yaml |  10 +-
 drivers/clk/imx/clk-imx8mp-audiomix.c              |   6 +-
 drivers/clk/imx/clk-imx8mp.c                       | 151 +++++++++++++++++++++
 4 files changed, 168 insertions(+), 7 deletions(-)
