Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1C04F0531
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 16:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788453811; cv=none; b=Yb6nvJD/N5xep35t79yab4Z7R869/nR6PCwASttMk0yfqmxFjDxkwndvYtOuvHn34z5qXYXL4CpTPNxZeTRe3o7ZJkCJdNr2ufvBPXVX55Cy+EZg0yvEh2u+fjy0LWy18OT5HWzisJMgsh55i/qrvpR2/iOR2twQ+zrFSkjlHEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788453811; c=relaxed/simple;
	bh=CXulU9ugcVs/yCyjMFB12dfhXuE9IH7phZFtkCoFrBI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QRFML0/cEXmvvw+js/uSTgULLg+1KL+/3RFlIimCx0wHrXXpdoS5wDeT/D7BMPa/nWdptPPFf9qfuc0Bk25nB2b8IEM3/ta4w9AKtEOUCD+1q/RFmdIE/+WKgOWG56cEIktl4+GCGIZhQ9SKq9v7urzwmbTahE6JZfR2hUp7nzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c6+ROWQ5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tdylXGNq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c6+ROWQ5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tdylXGNq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788453808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V8sg4Ic+uUI0uGmJLbnp+7IK0wyVe9CAzpqU2xH+Oy4=;
	b=c6+ROWQ5UUQdmGn2N8jgzQ4WsIZpogGpMaJ7r51XcFdwEmEHQ8gWwj4Dv39yqfCY9JZthM
	KT3U6uWRA2su9WiQPNsCSeLVESsmXwHfTKp2hcUPNoOxyhCgKY55a9ZJUeq6bYr7xDWwiL
	sr3+s170a+WZOmADRWnAtxV3xc8KCIc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-Hqq2rZigPDa6nzrDjuhQtw-1; Thu, 03 Sep 2026 12:43:27 -0400
X-MC-Unique: Hqq2rZigPDa6nzrDjuhQtw-1
X-Mimecast-MFC-AGG-ID: Hqq2rZigPDa6nzrDjuhQtw_1788453807
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390a2c895bso1101585a.0
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 09:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788453807; x=1789058607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8sg4Ic+uUI0uGmJLbnp+7IK0wyVe9CAzpqU2xH+Oy4=;
        b=tdylXGNqqpvXvwpy0/7+K9soCjiiFW9jZ0tjkd01krRIZ7wMX0K0MPjinnArDUJUSN
         5AT4E9O4qOf8xxnNMjsSOIDwpgsVwwTtRlKhQ7SK/ptVvS1Yi8wDmV4DSY+6sHlWUVHM
         F+atvAF8ogtaXR3xr848mEypY2pvxELyhfg+r7x2Bai/NO6qcSidMwRzQySQ5XKkmTGf
         aZr8mvwr/Oq5bxp7MzMZFr9JUAV+sDZopaU6lD/5nc7MCa8pdUW28s4PU+0TyT6SzO79
         rguRUw3fR0N6rd7o+ZlycTawrF1n195EMSe+Cuazs7G+SAH1aQIMfKEtBjvqCrP/JH0E
         RiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788453807; x=1789058607;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8sg4Ic+uUI0uGmJLbnp+7IK0wyVe9CAzpqU2xH+Oy4=;
        b=nGSwDAXwUzrP90+EV9n/0g9oLdLHwPah7Y5NLZN3Hw9/+NBYI9K5g/hRV+uQQHdwak
         NxNGHx3HztwEq/PDDwKaXh/r4q//Sr18Ri/eHykMuR8/GN7A+XAEUCwZf0HzLHquywA/
         RResiqET0dFayoqlIqRpkvQ0X2DlfX4rlSq3LBbKmFlJdtbV6KUiq0vxgomHwSPVKi1K
         krpcDZ2xon0Fld6JpcNQrdIZeYlljB8QqZFdjR7URFWKmFQv+aNDklzU8ACjfOyUyANr
         H5iRR9jQIB2L9kqnO8rwsYqYaaI/TlaCUS1Pb1lYkpTxahJMjRt+kM0SGwspVlCCR0nf
         tMyw==
X-Gm-Message-State: AFuF++ke23gcMt/HYJKAYpWZfYo6wYwhVwWiCu0zt4Ud7zbMiU56qp8C
	iTRfC2Eh/uc9IbXZeArSjHsx5bXl8kkWWqkR2PwOHzB2Nc/TS95MOw5tGRULqVec1Ih9/CoEP2P
	QfgqZZn21lvPO1Z6YucA/PUvmnqnCq48diUOm6/tXDqVTxqShAqiglVRGvSY6kA==
X-Gm-Gg: AYBFou1R2xEgqOzh0i7+tNDo97Q9iw1EHRqmwHJ7fUsBKjjbgeQ8LN9i5HS2aUbn9kP
	JODGf7tQIvImSRV6O6jHExy0TzhZ4ZUDGL1Ppdxd9AojZIs4UAmvc6OGZMvPGGRi4RmJpFq8R+F
	IzlNn/72SuVSmhf9dODqZ6zuKkWsRDlWbIjm1WFf3m32Aun6txA9gm23HpO98CxnbOomQXB+urj
	r0qBelxvVyQll3NWzvuzfij+XVFcnGCciDzDj0SiWQQOHcL281grvn2AXxmhDr2b6lSrCN1W4U1
	ffq9A0rnShxn08N69BzioZOskIfTsppL+8zIVdHAzLAEkBFDfDycps4a6WjmZAYJAKoFWfpnP/I
	oEG37Kq7xCZl1rRrwpj1j2LThuWA2DGMhItV7n+4=
X-Received: by 2002:a05:620a:6187:b0:939:6df3:d7f6 with SMTP id af79cd13be357-9396df3de25mr992395685a.49.1788453801839;
        Thu, 03 Sep 2026 09:43:21 -0700 (PDT)
X-Received: by 2002:a05:620a:6187:b0:939:6df3:d7f6 with SMTP id af79cd13be357-9396df3de25mr992386285a.49.1788453801386;
        Thu, 03 Sep 2026 09:43:21 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee270d0sm47491336d6.18.2026.09.03.09.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:43:20 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 stable@vger.kernel.org
In-Reply-To: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org>
References: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org>
Subject: Re: [PATCH] clk: mediatek: Add missing depend for
 COMMON_CLK_MT8173
Message-Id: <178845378565.22448.12859439275506649984.b4-ty@b4>
Date: Thu, 03 Sep 2026 12:43:05 -0400
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=317; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Y+oggqG3Z8L+JxkjNpwIvq7dXqEwG7Da2Hajvvt/Msg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJmLp4vln/w9uWnFpMnBh3+s5IzyCRo3jTeQ88mBbj8y
 GR/EvCgvqOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJ3Ahg+O86/dGb5RGeNw8x
 nv+Y6dMhWWrzZE5A6oGlMo+NmKP7Cl8y/PfOydx3s8egMeH7vrvRv2R+z3jEeTuj8P9/m8aGvU3
 r23kB
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Mon, 31 Aug 2026 08:50:56 +0000, Ricardo Ribalda wrote:
> clk: mediatek: Add missing depend for COMMON_CLK_MT8173

Applied, thanks!

[1/1] clk: mediatek: Add missing depend for COMMON_CLK_MT8173
      commit: 84964d0ce3faed815e1b8e048ce5ce1c93badb18

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

