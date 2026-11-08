Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169386;
	b=q/NamCOty1qzXY7bRjUZjgvoHCZAaJ6LWDPHZMXbzgBjTjmYw3mID3E8o5XBsb4YPKfh
	 shx7vVXpFMu7bbWHWSu5XVsPQ4lD+ZIj17w0cyRGm6I+13E4M4F405bvtxnqm3P8JARLr
	 87kRmNYY7svRQD88oyLIy94pgzDnAcFHZDDjBsTNGhct2krYQjI4ORNRrqULkMaOoAyI1
	 Ubu/i7bmrgZcUuRxPJEPqZzhYpkrYDNIlvXxhsKka5YLEO96qgkCIjt895kXaDb1qC8HO
	 7LjOunVco8xGcVj/Gr3HgJYloP5CKNNiByUM6fmELmKem6Di45i5tCAwHGDvZUlDICw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169386;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=IMaQtWfkI2+nDAxSWxsRjzUPOhBE/O3gBqUNL4FUSOs=;
	b=lBy7iNOfEjA7YJHZaNmUgQj6CjBXTm61NIGs3hslnamGEay1ZBz9BXcXbIHWtm0NhIs1
	 dDXo+1FDDzEs5eO8DcCwEIBG0oj5vsEIIj1owwbWuOGVNCIN+TRf4KLoRDCzgu16gjSiy
	 z0XBYr2EaxKx08usZ/wNhOKlYupkFeJlOD6gR8iUZV9w78KnJf7oPlVXO+uXo9oI8VYT0
	 IPM+XEu05yh5IiWwtaU5HKuF+tc5Y7AQSauo0ZzhefbWx6WoruYUUhM/ywF/ADCaMOckD
	 vFwFLhgeM8CiTwNI8t8r5jM+9eAGoHPgGfehV87GUMDwkbbDMtT39zAPzNNvS4ZCiTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DX5feHJO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E551606D12E;
	Sun,  8 Nov 2026 20:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DX5feHJO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E9A1F00902;
	Sun,  8 Nov 2026 20:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169386;
	bh=IMaQtWfkI2+nDAxSWxsRjzUPOhBE/O3gBqUNL4FUSOs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DX5feHJOnRjzf9N0BsJP5nGg+9WIgOxrWw1PkxR3q9fht1Mgq1Yuzt4shUC/fG4gZ
	 tuo0tO9Me5OgehKRlAkzH2P8c4EZ3hnZkpxHPXq/AZzCKPNTsPXlamdyylIJw+urNv
	 MSuEMIzCC7sI+xphijghlbwWbWFyFqs0EWKjAc2LzsU+hnpY6IY+O3IgzLi6tlR7du
	 nZiCuKPtSEIgkZ0yjtW6R2dWTCxBDanhYyAwYYUgwNsRYtP1+h5RfxCYv68c+P8ixd
	 +t3WVhZ3lB8V4hZ6tbPdSUYEdVgMs0thgXomxhNj4tGhCTaRoCXmME0mvtbIm9DbPk
	 Gk10fIFolbyWw==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-glymur: Use PWRSTS_RET_ON flag for USB GDSCs
Date: Sun,  8 Nov 2026 14:19:57 -0600
Message-ID: <179416929391.628393.13767365264983463444.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
References: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit


On Fri, 16 Oct 2026 11:58:44 +0530, Jagadeesh Kona wrote:
> The USB GDSCs on Glymur are currently configured with PWRSTS_OFF_ON,
> which allows the GDSC framework to fully collapse these power domains
> during gdsc_disable(). When these GDSCs collapse, the corresponding USB
> configurations are not retained in USB host mode use-cases and this breaks
> the resume of USB controller from suspend.
> 
> To avoid this, configure the USB GDSC power states to PWRSTS_RET_ON. This
> prevents the GDSC from powering off during gdsc_disable(), and allows
> hardware to retain the USB configurations across USB host mode use-cases.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-glymur: Use PWRSTS_RET_ON flag for USB GDSCs
      commit: 39477c344da4ecc63229d9d7518857ff37f7fa96

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
